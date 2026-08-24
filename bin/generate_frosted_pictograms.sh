#!/bin/bash

# Converts the committed SVGs from
# packages/frosted-ui-icons/pictograms in whopio/frosted-ui into an asset
# catalog. Each pictogram must have light, dark, and orange source variants.
#
# Usage:
#   ./bin/generate_frosted_pictograms.sh /path/to/pictograms

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-pictograms-folder>" >&2
    exit 1
fi

SOURCE_PATH="$(cd "$1" 2>/dev/null && pwd)" || {
    echo "Error: pictogram source folder '$1' does not exist." >&2
    exit 1
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DEST_PATH="$ROOT_DIR/Sources/FrostedUI/Resources/Pictograms.xcassets"
STAGING_ROOT="$(mktemp -d)"
STAGING_PATH="$STAGING_ROOT/Pictograms.xcassets"

trap 'rm -rf "$STAGING_ROOT"' EXIT

python3 - "$SOURCE_PATH" "$STAGING_PATH" <<'PY'
import json
import re
import shutil
import sys
from pathlib import Path

source = Path(sys.argv[1])
destination = Path(sys.argv[2])
filename_pattern = re.compile(
    r"^(?P<name>[a-z0-9]+(?:-[a-z0-9]+)*)-(?P<variant>light|dark|orange)-pictogram\.svg$"
)


def lower_camel(kebab_name: str) -> str:
    parts = kebab_name.split("-")
    name = parts[0] + "".join(part[:1].upper() + part[1:] for part in parts[1:])
    if name[0].isdigit():
        name = "pictogram" + name[:1].upper() + name[1:]
    return name


pictograms: dict[str, dict[str, Path]] = {}
unexpected_files: list[str] = []

for svg in sorted(source.glob("*.svg")):
    match = filename_pattern.fullmatch(svg.name)
    if match is None:
        unexpected_files.append(svg.name)
        continue

    raw_name = match.group("name")
    variant = match.group("variant")
    asset_name = lower_camel(raw_name)
    variants = pictograms.setdefault(asset_name, {})
    if variant in variants:
        raise SystemExit(f"Duplicate {variant} variant for '{asset_name}'.")
    variants[variant] = svg

if unexpected_files:
    names = "\n  - ".join(unexpected_files)
    raise SystemExit(f"Unexpected SVG filenames:\n  - {names}")

if not pictograms:
    raise SystemExit(f"No pictogram SVGs found in '{source}'.")

required_variants = {"light", "dark", "orange"}
for asset_name, variants in pictograms.items():
    missing = sorted(required_variants - variants.keys())
    if missing:
        raise SystemExit(f"Pictogram '{asset_name}' is missing variants: {', '.join(missing)}")

destination.mkdir(parents=True)
(destination / "Contents.json").write_text(
    json.dumps({"info": {"author": "xcode", "version": 1}}, indent=2) + "\n",
    encoding="utf-8",
)

for asset_name, variants in sorted(pictograms.items()):
    automatic_imageset = destination / f"{asset_name}.imageset"
    automatic_imageset.mkdir()

    light_filename = f"{asset_name}-light.svg"
    dark_filename = f"{asset_name}-dark.svg"
    shutil.copyfile(variants["light"], automatic_imageset / light_filename)
    shutil.copyfile(variants["dark"], automatic_imageset / dark_filename)

    automatic_contents = {
        "images": [
            {"filename": light_filename, "idiom": "universal"},
            {
                "appearances": [{"appearance": "luminosity", "value": "dark"}],
                "filename": dark_filename,
                "idiom": "universal",
            },
        ],
        "info": {"author": "xcode", "version": 1},
        "properties": {"preserves-vector-representation": True},
    }
    (automatic_imageset / "Contents.json").write_text(
        json.dumps(automatic_contents, indent=2) + "\n",
        encoding="utf-8",
    )

    orange_asset_name = f"{asset_name}Orange"
    orange_imageset = destination / f"{orange_asset_name}.imageset"
    orange_imageset.mkdir()
    orange_filename = f"{asset_name}-orange.svg"
    shutil.copyfile(variants["orange"], orange_imageset / orange_filename)
    orange_contents = {
        "images": [{"filename": orange_filename, "idiom": "universal"}],
        "info": {"author": "xcode", "version": 1},
        "properties": {"preserves-vector-representation": True},
    }
    (orange_imageset / "Contents.json").write_text(
        json.dumps(orange_contents, indent=2) + "\n",
        encoding="utf-8",
    )

print(f"Prepared {len(pictograms)} pictograms ({len(pictograms) * 3} SVG variants).")
PY

mkdir -p "$(dirname "$DEST_PATH")"
rm -rf "$DEST_PATH"
mv "$STAGING_PATH" "$DEST_PATH"

bash "$SCRIPT_DIR/generate_pictogram_extensions.sh"

echo "Generated pictograms in $DEST_PATH."
