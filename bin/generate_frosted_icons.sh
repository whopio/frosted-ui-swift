#!/bin/bash

# Download the frosted UI icons zip and copy all SVGs into
# Sources/FrostedUI/Resources/Icons.xcassets, then
# generate Swift enums/extensions for them.
#
# Usage:
#   ./generate_frosted_icons.sh                    # Downloads from GitHub
#   ./generate_frosted_icons.sh /path/to/icons.zip # Uses local zip file

ZIP_URL="https://github.com/whopio/frosted-ui/raw/main/packages/frosted-ui-icons/frosted-ui-icons.zip"

# Get the root directory of the project
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

DEST_DIR="Sources/FrostedUI/Resources/Icons.xcassets"
DEST_PATH="$ROOT_DIR/$DEST_DIR"

TMP_DIR="$(mktemp -d)"
ZIP_PATH="$TMP_DIR/frosted-ui-icons.zip"
EXTRACT_PATH="$TMP_DIR/extracted"

# Check if a local zip file was provided
if [ -n "$1" ] && [ -f "$1" ]; then
    echo "Using local zip file: $1"
    cp "$1" "$ZIP_PATH"
else
    echo "Downloading frosted-ui-icons.zip from $ZIP_URL..."
    curl -L "$ZIP_URL" -o "$ZIP_PATH"
    if [ $? -ne 0 ]; then
        echo "Failed to download frosted-ui-icons.zip. Exiting."
        rm -rf "$TMP_DIR"
        exit 1
    fi
fi

echo "Extracting icons..."
mkdir -p "$EXTRACT_PATH"
unzip -q "$ZIP_PATH" -d "$EXTRACT_PATH"
if [ $? -ne 0 ]; then
    echo "Failed to unzip frosted-ui-icons.zip. Exiting."
    rm -rf "$TMP_DIR"
    exit 1
fi

echo "Ensuring destination directory exists at $DEST_PATH..."
mkdir -p "$DEST_PATH"

# Clear existing content in the destination directory, but keep Contents.json if present
echo "Clearing existing icons in $DEST_PATH (preserving Contents.json if present)..."
find "$DEST_PATH" -mindepth 1 -maxdepth 1 ! -name "Contents.json" -exec rm -rf {} +

echo "Processing .svg icons into .imageset folders..."
find "$EXTRACT_PATH" -type f -name "*.svg" | while read -r svg; do
    filename=$(basename "$svg")        # e.g. add-user-12.svg
    name="${filename%.svg}"            # e.g. add-user-12
    size="${name##*-}"                 # e.g. 12
    base="${name%-*}"                  # e.g. add-user

    # Require a numeric size suffix
    if ! [[ "$size" =~ ^[0-9]+$ ]]; then
        echo "Skipping icon with non-numeric size: $filename"
        continue
    fi

    # Only support the 5 standard sizes we care about
    if ! [[ "$size" =~ ^(12|16|20|24|32)$ ]]; then
        echo "Skipping icon with unsupported size ($size): $filename"
        continue
    fi

    # Convert the base name from kebab-case to lowerCamelCase (e.g., add-user -> addUser)
    base_camel=$(echo "$base" | awk -F'-' '{ for (i=1;i<=NF;i++) { if (i==1) printf "%s", $i; else printf "%s%s", toupper(substr($i,1,1)), substr($i,2); } }')

    # Ensure the imageset name starts with a valid character; prefix with "icon" if it starts with a digit
    first_char=$(printf "%s" "$base_camel" | cut -c1)
    if [[ "$first_char" =~ [0-9] ]]; then
        base_camel="icon${base_camel^}"
    fi

    imageset_name="${base_camel}${size}"          # e.g. addUser12
    imageset_dir="$DEST_PATH/$imageset_name.imageset"

    mkdir -p "$imageset_dir"

    # Ensure there is only a single SVG per imageset to avoid unassigned children
    rm -f "$imageset_dir"/*.svg

    # Copy the SVG into the imageset folder, truncating any garbage after </svg>
    # (workaround for bug in generate-icon-lib that concatenates extra path data)
    sed -n '1,/<\/svg>/p' "$svg" > "$imageset_dir/$filename"

    # Create Contents.json for this imageset
    cat > "$imageset_dir/Contents.json" <<EOT
{
  "images" : [
    {
      "filename" : "$filename",
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  },
  "properties" : {
    "preserves-vector-representation" : true,
    "template-rendering-intent" : "template"
  }
}
EOT
done

echo "Cleaning up temporary files..."
rm -rf "$TMP_DIR"

# Check if svgo is installed
if ! command -v svgo &> /dev/null; then
    echo "svgo could not be found. Installing it using 'npm install -g svgo'."
    npm install -g svgo 
    if [ $? -ne 0 ]; then
        echo "Failed to install svgo. Please install it manually."
        exit 1
    fi
fi

# TODO: Some SVGs from Figma have malformed content that svgo can't parse.
# Running with || true to skip errors for now. Fix the source SVGs in Figma.
# Run svgo on all SVGs in the destination directory
svgo -rf "$DEST_PATH" || true

# Trim the freshly downloaded set down to icons-allowlist.txt (which then
# regenerates Icon+Extensions.swift). Keeps every Figma sync limited to the
# icons consumers actually reference instead of re-shipping the full ~5,000.
TRIM_SCRIPT="$SCRIPT_DIR/trim_icons.sh"
if [ -f "$TRIM_SCRIPT" ]; then
    echo "Running trim_icons.sh..."
    bash "$TRIM_SCRIPT"
    if [ $? -eq 0 ]; then
        echo "trim_icons.sh ran successfully!"
    else
        echo "trim_icons.sh encountered an error."
        exit 1
    fi
else
    echo "trim_icons.sh not found at $TRIM_SCRIPT. Skipping Swift icon generation."
fi

echo "Done."
