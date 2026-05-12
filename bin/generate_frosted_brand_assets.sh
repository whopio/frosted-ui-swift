#!/bin/bash

# Process a folder (or zip) of brand asset SVGs into
# Sources/FrostedUI/Resources/BrandAssets.xcassets, compress them with
# svgo, and generate Swift enums/extensions for them.
#
# Brand assets are full-color illustrations (not template icons), so
# the generated imagesets do NOT set template-rendering-intent.
#
# Usage:
#   ./generate_frosted_brand_assets.sh /path/to/folder        # Folder of SVGs
#   ./generate_frosted_brand_assets.sh /path/to/assets.zip    # Zip of SVGs

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-svg-folder-or-zip>"
    exit 1
fi

SOURCE="$1"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

DEST_DIR="Sources/FrostedUI/Resources/BrandAssets.xcassets"
DEST_PATH="$ROOT_DIR/$DEST_DIR"

TMP_DIR="$(mktemp -d)"
EXTRACT_PATH="$TMP_DIR/extracted"
mkdir -p "$EXTRACT_PATH"

# Resolve source: zip vs directory
if [ -f "$SOURCE" ] && [[ "$SOURCE" == *.zip ]]; then
    echo "Extracting zip: $SOURCE"
    unzip -q "$SOURCE" -d "$EXTRACT_PATH"
    SRC_PATH="$EXTRACT_PATH"
elif [ -d "$SOURCE" ]; then
    SRC_PATH="$SOURCE"
else
    echo "Source not found or unsupported: $SOURCE"
    exit 1
fi

echo "Ensuring destination directory exists at $DEST_PATH..."
mkdir -p "$DEST_PATH"

# Make sure the xcassets has a Contents.json marker
if [ ! -f "$DEST_PATH/Contents.json" ]; then
    cat > "$DEST_PATH/Contents.json" <<'EOT'
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOT
fi

echo "Clearing existing brand assets in $DEST_PATH (preserving Contents.json)..."
find "$DEST_PATH" -mindepth 1 -maxdepth 1 ! -name "Contents.json" -exec rm -rf {} +

# Convert an arbitrary filename base to lowerCamelCase, e.g.
#   "3D-PRINTER-GREEN"  -> "asset3DPrinterGreen"
#   "5G BLUE"           -> "asset5GBlue"
#   "PHONE-RED 1"       -> "phoneRed1"
#   "SHOP-BLUE-1"       -> "shopBlue1"
to_camel() {
    local raw="$1"
    # Lowercase, replace any run of non-alnum with single dash, trim.
    local kebab
    kebab=$(printf "%s" "$raw" \
        | tr '[:upper:]' '[:lower:]' \
        | sed -E 's/[^a-z0-9]+/-/g' \
        | sed -E 's/^-+//; s/-+$//')

    local camel
    camel=$(printf "%s" "$kebab" | awk -F'-' '{
        for (i = 1; i <= NF; i++) {
            if (i == 1) printf "%s", $i;
            else printf "%s%s", toupper(substr($i,1,1)), substr($i,2);
        }
    }')

    local first
    first=$(printf "%s" "$camel" | cut -c1)
    if [[ "$first" =~ [0-9] ]]; then
        # Prefix invalid leading digits and capitalize the original first char.
        local rest="${camel:1}"
        camel="asset$(printf "%s" "${camel:0:1}" | tr '[:lower:]' '[:upper:]')$rest"
    fi
    printf "%s" "$camel"
}

echo "Processing .svg brand assets into .imageset folders..."

# First pass: compute the camelCase name for every SVG so we can detect
# which "...1" names can be safely stripped to the bare form.
declare -a svg_paths
declare -a svg_names

while IFS= read -r -d '' svg; do
    filename=$(basename "$svg")
    base="${filename%.svg}"
    name=$(to_camel "$base")
    if [ -z "$name" ]; then
        echo "Skipping unprintable name: $filename"
        continue
    fi
    svg_paths+=("$svg")
    svg_names+=("$name")
done < <(find "$SRC_PATH" -type f -name "*.svg" -print0)

name_is_taken() {
    local needle="$1"
    local n
    for n in "${svg_names[@]}"; do
        if [ "$n" = "$needle" ]; then
            return 0
        fi
    done
    return 1
}

# Second pass: for each name ending in a trailing "1" (e.g. "phoneRed1"),
# drop the "1" if no other asset already claims the bare name.
for i in "${!svg_names[@]}"; do
    name="${svg_names[$i]}"
    if [[ "$name" =~ ^(.+[A-Za-z])1$ ]]; then
        stripped="${BASH_REMATCH[1]}"
        if ! name_is_taken "$stripped"; then
            echo "Renaming '$name' -> '$stripped' (no collision)"
            svg_names[$i]="$stripped"
        fi
    fi
done

declare -a created
for i in "${!svg_paths[@]}"; do
    svg="${svg_paths[$i]}"
    name="${svg_names[$i]}"
    filename=$(basename "$svg")

    imageset_dir="$DEST_PATH/$name.imageset"
    if [ -d "$imageset_dir" ]; then
        echo "Warning: name collision for '$name' (from '$filename') — skipping duplicate"
        continue
    fi

    mkdir -p "$imageset_dir"

    # Truncate any garbage after </svg> (same workaround as the icons script).
    sed -n '1,/<\/svg>/p' "$svg" > "$imageset_dir/$name.svg"

    cat > "$imageset_dir/Contents.json" <<EOT
{
  "images" : [
    {
      "filename" : "$name.svg",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "preserves-vector-representation" : true
  }
}
EOT
    created+=("$name")
done

echo "Created ${#created[@]} brand asset imagesets."

echo "Cleaning up temporary files..."
rm -rf "$TMP_DIR"

if ! command -v svgo &> /dev/null; then
    echo "svgo could not be found. Installing it using 'npm install -g svgo'."
    npm install -g svgo
    if [ $? -ne 0 ]; then
        echo "Failed to install svgo. Please install it manually."
        exit 1
    fi
fi

# Some SVGs from Figma have malformed content that svgo can't parse.
# Running with || true to skip errors for now. Fix the source SVGs in Figma.
svgo -rf "$DEST_PATH" || true

EXT_SCRIPT="$SCRIPT_DIR/generate_brand_asset_extensions.sh"
if [ -f "$EXT_SCRIPT" ]; then
    echo "Running generate_brand_asset_extensions.sh..."
    bash "$EXT_SCRIPT"
else
    echo "generate_brand_asset_extensions.sh not found at $EXT_SCRIPT. Skipping Swift generation."
fi

echo "Done."
