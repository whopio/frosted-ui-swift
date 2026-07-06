#!/bin/bash

# Delete every icon imageset from Icons.xcassets whose base name is not listed
# in icons-allowlist.txt, then regenerate the FrostedIcon enum + FrostedIconSet
# presets from whatever survives.
#
# The full Figma set is ~5,000 imagesets but the whop apps use only a few
# hundred bases. Trimming to the allowlist roughly halves the compiled
# Assets.car. Because Icon+Extensions.swift is generated from the imagesets on
# disk, a trimmed icon becomes a compile error the moment a consumer references
# it (no runtime fallback).
#
# Usage:
#   ./bin/trim_icons.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

ICONS_PATH="$ROOT_DIR/Sources/FrostedUI/Resources/Icons.xcassets"
ALLOWLIST="$ROOT_DIR/icons-allowlist.txt"

if [ ! -d "$ICONS_PATH" ]; then
    echo "Error: Icons path '$ICONS_PATH' does not exist. Exiting."
    exit 1
fi

if [ ! -f "$ALLOWLIST" ]; then
    echo "Error: allowlist '$ALLOWLIST' does not exist. Exiting."
    exit 1
fi

# Normalize the allowlist into a sorted lookup file (comments + blanks stripped).
ALLOWED_FILE="$(mktemp)"
trap 'rm -f "$ALLOWED_FILE"' EXIT
sed -e 's/#.*//' -e 's/[[:space:]]//g' "$ALLOWLIST" | grep . | sort -u > "$ALLOWED_FILE"

echo "Loaded $(grep -c . "$ALLOWED_FILE") allowlisted icon bases."

kept=0
deleted=0

# Delete any imageset whose base name (size suffix stripped) is not allowlisted.
while IFS= read -r dir; do
    imageset_name=$(basename "$dir")        # e.g. addUser12.imageset
    asset_name="${imageset_name%.imageset}" # e.g. addUser12

    if [[ "$asset_name" =~ (12|16|20|24|32)$ ]]; then
        size="${BASH_REMATCH[1]}"
    else
        echo "Skipping imageset without supported size suffix: $imageset_name"
        continue
    fi

    base="${asset_name%$size}"              # e.g. addUser

    if grep -qxF "$base" "$ALLOWED_FILE"; then
        kept=$((kept + 1))
    else
        rm -rf "$dir"
        deleted=$((deleted + 1))
    fi
done < <(find "$ICONS_PATH" -maxdepth 1 -type d -name "*.imageset")

echo "Kept $kept imagesets, deleted $deleted."

# Fail loudly if an allowlisted base matched no imageset at all. (A base need
# not have all five sizes -- e.g. qrCode ships only 16/20/24/32 -- but at least
# one variant must survive, otherwise the allowlist entry is a typo.)
missing=0
while IFS= read -r base; do
    found=no
    for size in 12 16 20 24 32; do
        if [ -d "$ICONS_PATH/${base}${size}.imageset" ]; then
            found=yes
            break
        fi
    done
    if [ "$found" = "no" ]; then
        echo "Warning: allowlisted base '$base' has no surviving imageset."
        missing=$((missing + 1))
    fi
done < "$ALLOWED_FILE"
if [ "$missing" -gt 0 ]; then
    echo "Error: $missing allowlisted base(s) matched no imageset. Run generate_frosted_icons.sh to pull the full set first."
    exit 1
fi

ICON_EXT_SCRIPT="$SCRIPT_DIR/generate_icon_extensions.sh"
echo "Running generate_icon_extensions.sh..."
bash "$ICON_EXT_SCRIPT"

echo "Done."
