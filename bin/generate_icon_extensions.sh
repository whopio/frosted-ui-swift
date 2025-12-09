#!/bin/bash

# Generate Swift enums and IconSet definitions for all SVG icons
# located in Sources/FrostedUI/Resources/Icons.xcassets.

ICONS_PATH="Sources/FrostedUI/Resources/Icons.xcassets"
OUTPUT_FILE="Sources/FrostedUI/Icons/Icon+Extensions.swift"

# Check if the icons path exists
if [ ! -d "$ICONS_PATH" ]; then
    echo "Error: Icons path '$ICONS_PATH' does not exist. Exiting."
    exit 1
fi

# Ensure the output directory exists
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Creating output directory '$OUTPUT_DIR'"
    mkdir -p "$OUTPUT_DIR"
fi

echo "Generating Swift icon enums and IconSet definitions into $OUTPUT_FILE"

# Start the Swift file with the import statement and enum definition
echo "import SwiftUI" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "public enum FrostedIcon: String, CaseIterable, Identifiable {" >> "$OUTPUT_FILE"
echo "    public var id: String { rawValue }" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

declare -a enum_cases
declare -a base_names

# Find all .imageset folders directly under the icons path
while IFS= read -r dir; do
    imageset_name=$(basename "$dir")        # e.g. addUser12.imageset
    asset_name="${imageset_name%.imageset}" # e.g. addUser12

    # Extract the size suffix (must be one of 12, 16, 20, 24, 32)
    if [[ "$asset_name" =~ (12|16|20|24|32)$ ]]; then
        size="${BASH_REMATCH[1]}"
    else
        echo "Skipping imageset without supported size suffix: $imageset_name"
        continue
    fi

    base="${asset_name%$size}"              # e.g. addUser

    # The enum case name is the same as the asset name
    enum_cases+=("    case ${asset_name} = \"${asset_name}\"")
    base_names+=("$base")
done < <(find "$ICONS_PATH" -maxdepth 1 -type d -name "*.imageset")

# Sort the enum cases alphabetically
IFS=$'\n' enum_cases=($(sort <<<"${enum_cases[*]}"))
unset IFS

# Append sorted enum cases to the Swift file
for enum_case in "${enum_cases[@]}"; do
    echo "$enum_case" >> "$OUTPUT_FILE"
done

cat <<'EOT' >> "$OUTPUT_FILE"
}

public extension Image {
    init(_ icon: FrostedIcon) {
        self.init(icon.rawValue, bundle: .module)
    }
}

public struct IconSet {
    public let size12: FrostedIcon
    public let size16: FrostedIcon
    public let size20: FrostedIcon
    public let size24: FrostedIcon
    public let size32: FrostedIcon

    public init(
        size12: FrostedIcon,
        size16: FrostedIcon,
        size20: FrostedIcon,
        size24: FrostedIcon,
        size32: FrostedIcon
    ) {
        self.size12 = size12
        self.size16 = size16
        self.size20 = size20
        self.size24 = size24
        self.size32 = size32
    }
}

public extension IconSet {
EOT

# Build unique, sorted list of base names for IconSet definitions
IFS=$'\n' bases_sorted=($(printf "%s\n" "${base_names[@]}" | sort -u))
unset IFS

# Helper to check if a specific FrostedIcon case exists
has_icon_case() {
    local needle="$1"
    local line
    for line in "${enum_cases[@]}"; do
        case "$line" in
            *" case ${needle} = "* ) return 0 ;;
        esac
    done
    return 1
}

for base in "${bases_sorted[@]}"; do
    has_all="yes"
    for size in 12 16 20 24 32; do
        if ! has_icon_case "${base}${size}"; then
            has_all="no"
        fi
    done

    if [ "$has_all" = "yes" ]; then
        echo "" >> "$OUTPUT_FILE"
        echo "    static let ${base} = IconSet(" >> "$OUTPUT_FILE"
        echo "        size12: .${base}12," >> "$OUTPUT_FILE"
        echo "        size16: .${base}16," >> "$OUTPUT_FILE"
        echo "        size20: .${base}20," >> "$OUTPUT_FILE"
        echo "        size24: .${base}24," >> "$OUTPUT_FILE"
        echo "        size32: .${base}32" >> "$OUTPUT_FILE"
        echo "    )" >> "$OUTPUT_FILE"
    fi
done

echo "}" >> "$OUTPUT_FILE"

echo "Swift icons file successfully generated at $OUTPUT_FILE"

