#!/bin/bash

# Generate Swift enums and IconSet definitions for all SVG icons
# located in FrostedUI/Sources/FrostedUI/Resources/Icons.xcassets.

ICONS_PATH="FrostedUI/Sources/FrostedUI/Resources/Icons.xcassets"
OUTPUT_FILE="FrostedUI/Sources/FrostedUI/Icons/Icon+Extensions.swift"

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

# Find all SVG files directly under the icons path
while IFS= read -r line; do
    filename=$(basename "$line")
    name="${filename%.svg}"          # e.g. add-user-12
    size="${name##*-}"               # e.g. 12
    base="${name%-*}"                # e.g. add-user

    # Skip any icons where the trailing segment is not a numeric size
    if ! [[ "$size" =~ ^[0-9]+$ ]]; then
        echo "Skipping icon with non-numeric size: $filename"
        continue
    fi

    # Convert the base name from kebab-case to lowerCamelCase (e.g., add-user -> addUser)
    base_camel=$(echo "$base" | awk -F'-' '{ for (i=1;i<=NF;i++) { if (i==1) printf "%s", $i; else printf "%s%s", toupper(substr($i,1,1)), substr($i,2); } }')

    # Ensure the case name starts with a valid character; prefix with "icon" if it starts with a digit
    first_char=$(printf "%s" "$base_camel" | cut -c1)
    if [[ "$first_char" =~ [0-9] ]]; then
        base_camel="icon${base_camel^}"
    fi

    case_name="${base_camel}${size}" # e.g. addUser12

    enum_cases+=("    case ${case_name} = \"${name}\"")
    base_names+=("$base_camel")
done < <(find "$ICONS_PATH" -maxdepth 1 -type f -name "*.svg")

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

for base in "${bases_sorted[@]}"; do
    echo "" >> "$OUTPUT_FILE"
    echo "    static let ${base} = IconSet(" >> "$OUTPUT_FILE"
    echo "        size12: .${base}12," >> "$OUTPUT_FILE"
    echo "        size16: .${base}16," >> "$OUTPUT_FILE"
    echo "        size20: .${base}20," >> "$OUTPUT_FILE"
    echo "        size24: .${base}24," >> "$OUTPUT_FILE"
    echo "        size32: .${base}32" >> "$OUTPUT_FILE"
    echo "    )" >> "$OUTPUT_FILE"
done

echo "}" >> "$OUTPUT_FILE"

echo "Swift icons file successfully generated at $OUTPUT_FILE"


