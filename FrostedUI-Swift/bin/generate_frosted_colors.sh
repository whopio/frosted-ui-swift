#!/bin/bash

# Set variables
REPO_URL="https://github.com/whopio/frosted-ui.git"
REPO_DIR="frosted-ui"
SOURCE_DIR="packages/frosted-ui-native-colors/colors"
DEST_DIR="Sources/FrostedUI/Resources/Colors.xcassets/Frosted"

# Get the root directory of the project
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../../../.." && pwd)"

# Full paths for clarity
REPO_PATH="$ROOT_DIR/$REPO_DIR"
SOURCE_PATH="$REPO_PATH/$SOURCE_DIR"
DEST_PATH="$ROOT_DIR/$DEST_DIR"

# Clone the repository
echo "Cloning the repository..."
git clone --depth 1 "$REPO_URL" "$REPO_PATH"

# Check if cloning was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone the repository. Exiting."
    exit 1
fi

# Verify the source directory exists
if [ ! -d "$SOURCE_PATH" ]; then
    echo "Source directory not found at $SOURCE_PATH. Exiting."
    exit 1
fi

# Ensure the destination directory exists
echo "Ensuring the destination directory exists..."
mkdir -p "$DEST_PATH"

# Clear existing content in the destination directory
echo "Deleting existing content in the destination directory..."
rm -rf "$DEST_PATH"/*

# Copy files from the source to the destination
echo "Copying files from $SOURCE_PATH to $DEST_PATH..."
cp -r "$SOURCE_PATH"/* "$DEST_PATH"

# Verify if copying was successful
if [ $? -eq 0 ]; then
    echo "Files copied successfully to $DEST_PATH!"
else
    echo "Failed to copy files. Exiting."
    exit 1
fi

# Rename folders to prefix with "new" and ensure camel case
echo "Renaming folders in $DEST_PATH..."
for folder in "$DEST_PATH"/*.colorset; do
    if [ -d "$folder" ]; then
        base_name=$(basename "$folder")
        dynamic_part=$(echo "$base_name" | sed -E 's/^(.*)\.colorset$/\1/' | awk -F '_' '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS='')
        new_name="frosted${dynamic_part}.colorset"
        mv "$folder" "$DEST_PATH/$new_name"
        echo "Renamed $folder to $DEST_PATH/$new_name"
    fi
done

# Cleanup
echo "Cleaning up temporary files..."
rm -rf "$REPO_PATH"

# Run the generate_color_extensions.sh script
EXTENSIONS_SCRIPT="$SCRIPT_DIR/generate_color_extensions.sh"
if [ -f "$EXTENSIONS_SCRIPT" ]; then
    echo "Running generate_color_extensions.sh..."
    bash "$EXTENSIONS_SCRIPT"
    if [ $? -eq 0 ]; then
        echo "generate_color_extensions.sh ran successfully!"
    else
        echo "generate_color_extensions.sh encountered an error."
        exit 1
    fi
else
    echo "generate_color_extensions.sh not found at $EXTENSIONS_SCRIPT. Skipping."
fi

echo "Done."
