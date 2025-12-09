#!/bin/bash

# Download the frosted UI icons zip and copy all SVGs into
# Sources/FrostedUI/Resources/Icons.xcassets, then
# generate Swift enums/extensions for them.

ZIP_URL="https://github.com/whopio/frosted-ui/raw/main/packages/frosted-ui-icons/frosted-ui-icons.zip"

# Get the root directory of the project
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

DEST_DIR="Sources/FrostedUI/Resources/Icons.xcassets"
DEST_PATH="$ROOT_DIR/$DEST_DIR"

TMP_DIR="$(mktemp -d)"
ZIP_PATH="$TMP_DIR/frosted-ui-icons.zip"
EXTRACT_PATH="$TMP_DIR/extracted"

echo "Downloading frosted-ui-icons.zip from $ZIP_URL..."
curl -L "$ZIP_URL" -o "$ZIP_PATH"
if [ $? -ne 0 ]; then
    echo "Failed to download frosted-ui-icons.zip. Exiting."
    rm -rf "$TMP_DIR"
    exit 1
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

    # Copy the SVG into the imageset folder
    cp "$svg" "$imageset_dir/$filename"

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

# Run svgo on all SVGs in the destination directory
svgo -rf "$DEST_PATH"

# Run the generate_icon_extensions.sh script
ICON_EXT_SCRIPT="$SCRIPT_DIR/generate_icon_extensions.sh"
if [ -f "$ICON_EXT_SCRIPT" ]; then
    echo "Running generate_icon_extensions.sh..."
    bash "$ICON_EXT_SCRIPT"
    if [ $? -eq 0 ]; then
        echo "generate_icon_extensions.sh ran successfully!"
    else
        echo "generate_icon_extensions.sh encountered an error."
        exit 1
    fi
else
    echo "generate_icon_extensions.sh not found at $ICON_EXT_SCRIPT. Skipping Swift icon generation."
fi

echo "Done."


