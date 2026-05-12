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
2. Group each set of SVGs by base name and ship them as one imageset per base:
   - The regular SVG goes in as the universal image.
   - If a `_dark.svg` sibling exists, it is added to the same imageset with `appearance: dark`, so iOS automatically picks the right one for light/dark mode.
3. Treat each `_over_orange.svg` as a separate asset (a separate enum case like `barcodeOverOrange`). To avoid bloating the library with re-exports, an `_over_orange` SVG is only shipped when its content — after stripping decimal noise from re-exported coords — actually differs from the regular sibling. The roughly half that are byte-identical-after-normalization to the regular are dropped.
4. Convert each filename to lowerCamelCase (`BEAKER-GREEN.svg` → `beakerGreen`). Names that start with a digit are prefixed with `asset` (`3D-PRINTER-GREEN.svg` → `asset3DPrinterGreen`).
5. Compress every SVG with [`svgo`](https://github.com/svg/svgo) (auto-installed via `npm install -g svgo` if missing).
6. Regenerate `BrandAsset+Extensions.swift` with one `FrostedBrandAsset` case per imageset and `Image` / `UIImage` initializers.

Usage in code:

```swift
// Light + dark switch automatically based on the environment:
Image(FrostedBrandAsset.beakerGreen)
    .resizable()
    .scaledToFit()

// Reach for the over-orange variant explicitly when drawing on orange:
Image(FrostedBrandAsset.barcodeOverOrange)
    .resizable()
    .scaledToFit()
```
