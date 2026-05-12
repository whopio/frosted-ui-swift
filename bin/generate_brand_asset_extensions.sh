#!/bin/bash

# Generate Swift enum and Image / UIImage extensions for all brand asset
# SVGs located in Sources/FrostedUI/Resources/BrandAssets.xcassets.

ASSETS_PATH="Sources/FrostedUI/Resources/BrandAssets.xcassets"
OUTPUT_FILE="Sources/FrostedUI/BrandAssets/BrandAsset+Extensions.swift"

if [ ! -d "$ASSETS_PATH" ]; then
    echo "Error: Brand assets path '$ASSETS_PATH' does not exist. Exiting."
    exit 1
fi

OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Creating output directory '$OUTPUT_DIR'"
    mkdir -p "$OUTPUT_DIR"
fi

echo "Generating Swift brand asset enum into $OUTPUT_FILE"

echo "import SwiftUI" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "public enum FrostedBrandAsset: String, CaseIterable, Identifiable {" >> "$OUTPUT_FILE"
echo "    public var id: String { rawValue }" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

declare -a enum_cases

while IFS= read -r dir; do
    imageset_name=$(basename "$dir")
    asset_name="${imageset_name%.imageset}"
    enum_cases+=("    case ${asset_name} = \"${asset_name}\"")
done < <(find "$ASSETS_PATH" -maxdepth 1 -type d -name "*.imageset")

IFS=$'\n' enum_cases=($(sort <<<"${enum_cases[*]}"))
unset IFS

for enum_case in "${enum_cases[@]}"; do
    echo "$enum_case" >> "$OUTPUT_FILE"
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
