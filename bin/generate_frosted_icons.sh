#!/bin/bash

# Download the frosted UI icons zip and copy all SVGs into
# FrostedUI/Sources/FrostedUI/Resources/Icons.xcassets, then
# generate Swift enums/extensions for them.

ZIP_URL="https://github.com/whopio/frosted-ui/raw/main/packages/frosted-ui-icons/frosted-ui-icons.zip"

# Get the root directory of the project
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

DEST_DIR="FrostedUI/Sources/FrostedUI/Resources/Icons.xcassets"
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

echo "Copying .svg icons into $DEST_PATH..."
find "$EXTRACT_PATH" -type f -name "*.svg" -exec cp {} "$DEST_PATH" \;
if [ $? -ne 0 ]; then
    echo "Failed to copy icons into $DEST_PATH. Exiting."
    rm -rf "$TMP_DIR"
    exit 1
fi

echo "Cleaning up temporary files..."
rm -rf "$TMP_DIR"

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


