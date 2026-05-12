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
2. Create one `.imageset` per SVG, with `preserves-vector-representation` enabled and no template rendering (brand assets are full color, not monochrome).
3. Convert each filename to lowerCamelCase (`BEAKER-GREEN.svg` → `beakerGreen`). Names that start with a digit are prefixed with `asset` (`3D-PRINTER-GREEN.svg` → `asset3DPrinterGreen`).
4. Compress every SVG with [`svgo`](https://github.com/svg/svgo) (auto-installed via `npm install -g svgo` if missing).
5. Regenerate `BrandAsset+Extensions.swift` with one enum case per asset and `Image` / `UIImage` initializers.

Usage in code:

```swift
Image(FrostedBrandAsset.beakerGreen)
    .resizable()
    .scaledToFit()
```
