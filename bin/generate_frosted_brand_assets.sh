#!/bin/bash

# Process a folder (or zip) of brand asset SVGs into
# Sources/FrostedUI/Resources/BrandAssets.xcassets, compress them with
# svgo, and generate Swift enums/extensions for them.
#
# Brand assets are full-color illustrations (not template icons), so the
# generated imagesets do NOT set template-rendering-intent.
#
# Variant handling:
#   * Each base asset becomes ONE imageset that holds the regular SVG as
#     the universal image and the `_dark.svg` as the dark-appearance image.
#     iOS picks automatically based on userInterfaceStyle.
#   * `_over_orange.svg` files become their OWN imagesets, exposed as a
#     separate enum case (e.g. `barcodeOverOrange`). To avoid bloating the
#     library with re-exports, the over_orange asset is only shipped when
#     its color palette actually differs from the regular sibling. Roughly
#     half are pure Figma re-exports (same palette, just rounded coords)
#     and the rest are real recolorings that swap the orange fills out for
#     a blue/green/etc. so the asset reads on an orange background.
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

# Run a python helper to:
#   1. Walk source SVGs, split into (core_camel, variant) records.
#   2. Strip a trailing "1" from cores when no collision-free base exists.
#   3. Decide which over_orange variants are content-different from their
#      regular sibling (and therefore worth shipping).
#   4. Build a plan that materializes the imagesets directly.
python3 - "$SRC_PATH" "$DEST_PATH" <<'PY'
import json
import re
import sys
from pathlib import Path

src_root = Path(sys.argv[1])
dest_root = Path(sys.argv[2])

HEX_COLOR_RE = re.compile(r"#[0-9a-fA-F]{6}")


def to_camel(raw: str) -> str:
    kebab = re.sub(r"[^a-z0-9]+", "-", raw.lower()).strip("-")
    if not kebab:
        return ""
    parts = kebab.split("-")
    camel = parts[0] + "".join(p[:1].upper() + p[1:] for p in parts[1:])
    if camel and camel[0].isdigit():
        camel = "asset" + camel[0].upper() + camel[1:]
    return camel


def palette(path: Path) -> frozenset:
    """Return the set of hex colors used in the SVG, lowercased.

    Figma sometimes re-exports the same artwork with coordinates nudged by a
    pixel, so a content hash can flag near-identical files as different.
    Comparing palettes is a tighter signal: a real over_orange variant always
    swaps the orange fills (#fa4616 etc.) for a different color, while a
    re-export keeps every color the same.
    """
    text = path.read_text(encoding="utf-8", errors="replace")
    return frozenset(c.lower() for c in HEX_COLOR_RE.findall(text))


def parse(filename: str):
    base = filename[:-4]  # strip .svg
    if "_over_orange" in base:
        return base.replace("_over_orange", ""), "OverOrange"
    if "_dark" in base:
        return base.replace("_dark", ""), "Dark"
    return base, ""


# 1. Group SVGs by (core_camel, variant).
records = {}  # core_camel -> {"": path, "Dark": path, "OverOrange": path}
for path in sorted(src_root.rglob("*.svg")):
    core_raw, variant = parse(path.name)
    core = to_camel(core_raw)
    if not core:
        continue
    records.setdefault(core, {})[variant] = path

# 2. Strip a trailing "1" from cores that have no naked-base collision.
for c in list(records.keys()):
    m = re.match(r"^(.+[A-Za-z])1$", c)
    if not m:
        continue
    stripped = m.group(1)
    if stripped in records:
        continue
    print(f"Renaming core '{c}' -> '{stripped}' (no collision)", file=sys.stderr)
    records[stripped] = records.pop(c)


def truncate_svg_after_close(path: Path) -> str:
    """Strip any garbage past the closing </svg>. Mirrors the icons script."""
    text = path.read_text(encoding="utf-8", errors="replace")
    idx = text.find("</svg>")
    if idx >= 0:
        return text[: idx + len("</svg>")] + "\n"
    return text


def write_imageset(name: str, light: Path, dark: Path | None):
    out = dest_root / f"{name}.imageset"
    out.mkdir(parents=True, exist_ok=True)
    images = []

    light_filename = f"{name}.svg"
    (out / light_filename).write_text(truncate_svg_after_close(light), encoding="utf-8")
    images.append({"filename": light_filename, "idiom": "universal"})

    if dark is not None:
        dark_filename = f"{name}-dark.svg"
        (out / dark_filename).write_text(truncate_svg_after_close(dark), encoding="utf-8")
        images.append({
            "appearances": [{"appearance": "luminosity", "value": "dark"}],
            "filename": dark_filename,
            "idiom": "universal",
        })

    contents = {
        "images": images,
        "info": {"author": "xcode", "version": 1},
        "properties": {"preserves-vector-representation": True},
    }
    (out / "Contents.json").write_text(
        json.dumps(contents, indent=2) + "\n", encoding="utf-8"
    )


# 3. Materialize imagesets.
created_regular = 0
created_over_orange = 0
skipped_over_orange = 0
for core, variants in records.items():
    light = variants.get("")
    if light is None:
        print(f"Skipping orphan asset (no regular variant): {core}", file=sys.stderr)
        continue
    dark = variants.get("Dark")
    write_imageset(core, light, dark)
    created_regular += 1

    oo = variants.get("OverOrange")
    if oo is None:
        continue
    # Only ship the over_orange asset when it actually recolors the artwork.
    # If it shares the regular's palette, it's just a Figma re-export with
    # rounded coordinates and would render identically.
    if palette(oo) == palette(light):
        skipped_over_orange += 1
        continue
    write_imageset(f"{core}OverOrange", oo, None)
    created_over_orange += 1

print(
    f"Created {created_regular} regular imagesets, "
    f"{created_over_orange} over_orange imagesets, "
    f"skipped {skipped_over_orange} duplicate over_orange variants.",
    file=sys.stderr,
)
PY

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
