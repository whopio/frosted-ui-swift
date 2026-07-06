#!/bin/bash

# Delete every imageset from BrandAssets.xcassets whose name is not listed in
# brand-assets-allowlist.txt, then regenerate the FrostedBrandAsset enum from
# whatever survives.
#
# The full Figma set is 96 imagesets (full-color illustrations, many in Blue /
# Green / over-orange color variants) but the whop apps reference only 26.
# Because BrandAsset+Extensions.swift is generated from the imagesets on disk, a
# trimmed asset becomes a compile error the moment a consumer references it (no
# runtime fallback, no dynamic rawValue/allCases lookup anywhere in consumers).
#
# Usage:
#   ./bin/trim_brand_assets.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

ASSETS_PATH="$ROOT_DIR/Sources/FrostedUI/Resources/BrandAssets.xcassets"
ALLOWLIST="$ROOT_DIR/brand-assets-allowlist.txt"

if [ ! -d "$ASSETS_PATH" ]; then
    echo "Error: brand assets path '$ASSETS_PATH' does not exist. Exiting."
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

echo "Loaded $(grep -c . "$ALLOWED_FILE") allowlisted brand asset names."

kept=0
deleted=0

# Delete any imageset whose name is not allowlisted.
while IFS= read -r dir; do
    imageset_name=$(basename "$dir")        # e.g. shieldGreen.imageset
    asset_name="${imageset_name%.imageset}" # e.g. shieldGreen

    if grep -qxF "$asset_name" "$ALLOWED_FILE"; then
        kept=$((kept + 1))
    else
        rm -rf "$dir"
        deleted=$((deleted + 1))
    fi
done < <(find "$ASSETS_PATH" -maxdepth 1 -type d -name "*.imageset")

echo "Kept $kept imagesets, deleted $deleted."

# Fail loudly if an allowlisted name matched no imageset (typo in the allowlist,
# or the asset was never generated).
missing=0
while IFS= read -r name; do
    if [ ! -d "$ASSETS_PATH/${name}.imageset" ]; then
        echo "Warning: allowlisted asset '$name' has no imageset on disk."
        missing=$((missing + 1))
    fi
done < "$ALLOWED_FILE"
if [ "$missing" -gt 0 ]; then
    echo "Error: $missing allowlisted asset(s) matched no imageset. Run generate_frosted_brand_assets.sh <src> to rebuild the full set first."
    exit 1
fi

EXT_SCRIPT="$SCRIPT_DIR/generate_brand_asset_extensions.sh"
echo "Running generate_brand_asset_extensions.sh..."
bash "$EXT_SCRIPT"

echo "Done."
