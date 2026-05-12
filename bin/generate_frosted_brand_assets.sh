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
#   * `_over_orange.svg` files become their OWN imagesets, named after the
#     color the variant actually uses (e.g. `balloonBlue`, `droneGreen`).
#     The script picks the dominant non-gray color that the variant adds
#     vs. the regular and turns that into the suffix. Files that don't
#     actually recolor anything (same palette, or only gray/orange swaps)
#     are dropped — the regular asset reads fine on orange already.
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

FILL_COLOR_RE = re.compile(r'fill="(#[0-9a-fA-F]{6})"')


def to_camel(raw: str) -> str:
    kebab = re.sub(r"[^a-z0-9]+", "-", raw.lower()).strip("-")
    if not kebab:
        return ""
    parts = kebab.split("-")
    camel = parts[0] + "".join(p[:1].upper() + p[1:] for p in parts[1:])
    if camel and camel[0].isdigit():
        camel = "asset" + camel[0].upper() + camel[1:]
    return camel


def fill_counts(path: Path) -> dict[str, int]:
    """Count each `fill="#rrggbb"` reference in the SVG, lowercased."""
    text = path.read_text(encoding="utf-8", errors="replace")
    counts: dict[str, int] = {}
    for match in FILL_COLOR_RE.findall(text):
        counts[match.lower()] = counts.get(match.lower(), 0) + 1
    return counts


def color_family(hex_color: str) -> str | None:
    """Classify a hex color into a coarse family by HSL.

    Returns None for mid-tone grays that don't carry a useful label. Very
    dark / very light colors get bucketed as "black" / "white" since the
    brand library actually uses them as recolor targets (e.g. the rocket
    tip flips from orange to black in the over-orange variant).
    """
    r = int(hex_color[1:3], 16) / 255
    g = int(hex_color[3:5], 16) / 255
    b = int(hex_color[5:7], 16) / 255
    cmax, cmin = max(r, g, b), min(r, g, b)
    delta = cmax - cmin
    lightness = (cmax + cmin) / 2
    if lightness < 0.15:
        return "black"
    if lightness > 0.93:
        return "white"
    if delta == 0:
        return None
    saturation = delta / (1 - abs(2 * lightness - 1))
    if saturation < 0.2:
        return None
    if cmax == r:
        hue = ((g - b) / delta) % 6
    elif cmax == g:
        hue = (b - r) / delta + 2
    else:
        hue = (r - g) / delta + 4
    hue *= 60
    if hue < 30 or hue >= 330:
        return "red"
    if hue < 70:
        return "orange"
    if hue < 165:
        return "green"
    if hue < 260:
        return "blue"
    return "purple"


def variant_suffix(core: str, regular: Path, over_orange: Path) -> str | None:
    """Pick the color suffix that names the over_orange variant.

    The two SVGs often share the same palette but redistribute the fills —
    e.g. one orange path becomes black, or a few orange paths become green.
    So we compare per-color fill counts, bucket the deltas by color family,
    and pick the family with the largest net gain. Families whose gain is
    cancelled out by an equal loss in the same family (Figma swapping one
    orange shade for another) net to zero and get skipped.

    Returns None when nothing meaningfully recolors. Falls back to a
    generic suffix when the chosen family would duplicate a word already
    in the base name (e.g. stadiumGreen's variant is still green).
    """
    reg_counts = fill_counts(regular)
    oo_counts = fill_counts(over_orange)

    family_net: dict[str, int] = {}
    for color in set(reg_counts) | set(oo_counts):
        delta = oo_counts.get(color, 0) - reg_counts.get(color, 0)
        if delta == 0:
            continue
        family = color_family(color)
        if family is None:
            continue
        family_net[family] = family_net.get(family, 0) + delta

    gainers = {f: d for f, d in family_net.items() if d > 0}
    if not gainers:
        return None
    # Prefer chromatic families — when Figma swaps a near-gray background
    # shade (e9e9e9 -> f3f3f3) alongside a real recolor, we want to name
    # the variant by the brand color, not the noisy background tweak.
    chromatic = {f: d for f, d in gainers.items() if f not in ("black", "white")}
    pool = chromatic or gainers
    best = max(pool.items(), key=lambda kv: (kv[1], -ord(kv[0][0])))
    suffix = best[0].capitalize()
    if core.lower().endswith(suffix.lower()):
        return "OverOrange"
    return suffix


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
    suffix = variant_suffix(core, light, oo)
    if suffix is None:
        skipped_over_orange += 1
        continue
    write_imageset(f"{core}{suffix}", oo, None)
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
