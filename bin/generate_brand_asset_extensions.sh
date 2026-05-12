#!/bin/bash

# Generate the Swift FrostedBrandAsset enum and Image / UIImage extensions
# for every imageset under Sources/FrostedUI/Resources/BrandAssets.xcassets.
#
# Each imageset becomes one enum case. Light/dark variants are handled by
# Xcode at the asset level (one imageset per base, with a dark appearance
# image inside it). Over-orange variants live in their own imagesets and
# show up as separate cases like `barcodeOverOrange`.

ASSETS_PATH="Sources/FrostedUI/Resources/BrandAssets.xcassets"
OUTPUT_FILE="Sources/FrostedUI/BrandAssets/BrandAsset+Extensions.swift"

if [ ! -d "$ASSETS_PATH" ]; then
    echo "Error: Brand assets path '$ASSETS_PATH' does not exist. Exiting."
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_FILE")"

echo "Generating Swift brand asset enum into $OUTPUT_FILE"

declare -a asset_names
while IFS= read -r dir; do
    imageset_name=$(basename "$dir")
    asset_names+=("${imageset_name%.imageset}")
done < <(find "$ASSETS_PATH" -maxdepth 1 -type d -name "*.imageset")

IFS=$'\n' asset_names=($(sort <<<"${asset_names[*]}"))
unset IFS

{
    echo "import SwiftUI"
    echo ""
    echo "public enum FrostedBrandAsset: String, CaseIterable, Identifiable {"
    echo "    public var id: String { rawValue }"
    echo ""
} > "$OUTPUT_FILE"

for name in "${asset_names[@]}"; do
    echo "    case ${name} = \"${name}\"" >> "$OUTPUT_FILE"
done

cat <<'EOT' >> "$OUTPUT_FILE"
}

public extension Image {
    init(_ asset: FrostedBrandAsset) {
        self.init(asset.rawValue, bundle: .module)
    }
}

public extension UIImage {
    convenience init?(_ asset: FrostedBrandAsset) {
        self.init(named: asset.rawValue, in: .module, compatibleWith: nil)
    }
}

#Preview {
    ScrollView {
        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
            ForEach(FrostedBrandAsset.allCases) { asset in
                Image(asset)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding()
    }
}
EOT

echo "Swift brand asset file successfully generated at $OUTPUT_FILE"
