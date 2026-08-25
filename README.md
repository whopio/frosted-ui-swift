# frosted-ui-swift

## Generate icons from Figma

Just run the [Github action](https://github.com/whopio/frosted-ui-swift/actions/workflows/generate-icons.yml) to pull the icons and generate the xcassets + Image extensions.

## Generate brand assets

Brand assets are the full-color illustrations exported from the Figma Brand Library (e.g. `BEAKER-GREEN.svg`, `5G-BLUE.svg`, etc.). They live in `Sources/FrostedUI/Resources/BrandAssets.xcassets` and are exposed through the `FrostedBrandAsset` enum in `Sources/FrostedUI/BrandAssets/BrandAsset+Extensions.swift`.

To regenerate them from a folder (or zip) of SVGs:

```bash
# From the repo root, point the script at the folder Figma exported.
./bin/generate_frosted_brand_assets.sh /path/to/Brand\ Library\ folder

# Or pass a zip file directly:
./bin/generate_frosted_brand_assets.sh /path/to/brand-library.zip
```

The script will:

1. Clear `Sources/FrostedUI/Resources/BrandAssets.xcassets` (preserving its `Contents.json`).
2. Group each set of SVGs by base name and ship them as one imageset per base. Only the regular SVG is shipped — `_dark.svg` siblings are currently skipped because they only tweak a few near-black shades (no perceivable difference at runtime) and would double the asset bundle. Dark-mode shipping is one commented line away in `generate_frosted_brand_assets.sh` (search for `DARK MODE DISABLED`) when those files diverge enough to matter.
3. Treat each `_over_orange.svg` as a separate asset, named after the color that replaces the orange in the variant (e.g. `bookBlue`, `droneGreen`). The script picks the dominant non-gray color family that the variant introduces, ignoring shade-only tweaks. Variants that don't actually recolor anything (Figma re-exports with the same palette) are dropped — the regular asset reads fine on orange already.
4. Convert each filename to lowerCamelCase (`BEAKER-GREEN.svg` → `beakerGreen`). Names that start with a digit are prefixed with `asset` (`3D-PRINTER-GREEN.svg` → `asset3DPrinterGreen`).
5. Compress every SVG with [`svgo`](https://github.com/svg/svgo) (auto-installed via `npm install -g svgo` if missing).
6. Regenerate `BrandAsset+Extensions.swift` with one `FrostedBrandAsset` case per imageset and `Image` / `UIImage` initializers.

Usage in code:

```swift
// Light + dark switch automatically based on the environment:
Image(FrostedBrandAsset.beakerGreen)
    .resizable()
    .scaledToFit()

// Reach for the orange-friendly variant explicitly when drawing on orange:
Image(FrostedBrandAsset.bookBlue)
    .resizable()
    .scaledToFit()
```

## Sync pictograms

Run the `Sync Frosted Pictograms` GitHub action to pull the committed light,
dark, and orange SVGs from
[`whopio/frosted-ui/packages/frosted-ui-icons/pictograms`](https://github.com/whopio/frosted-ui/tree/main/packages/frosted-ui-icons/pictograms).
The action opens a draft pull request containing the regenerated
`BrandAssets.xcassets` catalog and `FrostedBrandAsset` Swift API. It uses the
existing brand-asset generator to omit near-duplicate dark variants, discard
orange variants that do not materially recolor the artwork, and compress the
remaining SVGs with a pinned SVGO version.

To generate the same output locally:

```bash
./bin/generate_frosted_brand_assets.sh /path/to/frosted-ui/packages/frosted-ui-icons/pictograms
```
