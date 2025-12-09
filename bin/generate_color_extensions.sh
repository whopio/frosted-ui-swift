#!/bin/bash

# Path to your Colors asset catalog
COLORS_PATH="FrostedUI/Sources/FrostedUI/Resources/Colors.xcassets"

# Output file where the generated Swift enum will be written
OUTPUT_FILE="FrostedUI/S/ources/FrostedUI/Color/Color+Extensions.swift"

# Check if the colors path exists
if [ ! -d "$COLORS_PATH" ]; then
    echo "Error: Colors path '$COLORS_PATH' does not exist. Exiting."
    exit 1
fi

# Check if the output directory exists, if not, create it
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Creating output directory '$OUTPUT_DIR'"
    mkdir -p "$OUTPUT_DIR"
fi

# Start the Swift file with the import statement and enum definition
echo "import SwiftUI" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "public enum FrostedColor: String, CaseIterable, Identifiable {" >> "$OUTPUT_FILE"
echo "    public var id: String { rawValue }" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Create an array to store enum cases
declare -a enum_cases

# Use find to list all .colorset directories in the Colors folder
while IFS= read -r line; do
    # Extract the asset name without the path and extension
    asset_name=$(basename "$line" .colorset)

    # Convert the asset name into camelCase (e.g., neutral_12 -> neutral12)
    enum_case=$(echo "$asset_name" | awk -F'_' '{ for(i=1;i<=NF;i++) { if(i==1) printf("%s", $i); else printf("%s%s", toupper(substr($i,1,1)), substr($i,2)); } }')

    # Add the enum case and corresponding asset name to the array
    if [ -n "$enum_case" ]; then
        enum_cases+=("    case ${enum_case}")
        echo "Added color: $asset_name as enum case: $enum_case"
    else
        echo "Warning: Failed to process color $asset_name"
    fi
done < <(find "$COLORS_PATH" -name "*.colorset")

# Sort the enum cases alphabetically
IFS=$'\n' enum_cases=($(sort <<<"${enum_cases[*]}"))
unset IFS

# Append sorted enum cases to the Swift file
for enum_case in "${enum_cases[@]}"; do
    echo "$enum_case" >> "$OUTPUT_FILE"
done

# Write additional Swift code for Color and UI inits
cat <<EOT >> "$OUTPUT_FILE"
}

public extension Color {
    init(_ color: FrostedColor) {
        self = Color(color.rawValue, bundle: .module)
    }
}

public extension UIColor {
    /// Fallback to clear color if the color is not found
    convenience init(_ color: FrostedColor, fallbackColor: UIColor = .clear) {
        if UIColor(named: color.rawValue, in: .module, compatibleWith: nil) != nil {
            self.init(named: color.rawValue, in: .module, compatibleWith: nil)!
        } else {
            self.init(cgColor: fallbackColor.cgColor)
        }
    }
}

// swiftlint:disable whop_localized_enums
public struct FrostedColorsPreviewView: View {
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(FrostedColor.allCases) { color in
                    HStack(spacing: 8) {
                        Color(color)
                            .frame(width: 20, height: 20)
                            .cornerRadius(4)

                        Text(color.rawValue)
                            .applySystemStyle(.callout, .regular)

                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    FrostedColorsPreviewView()
}

#Preview {
    FrostedColorsPreviewView()
        .preferredColorScheme(.dark)
}
EOT

# Generate a FrostedTint extension with grouped frosted palettes.
{
    echo ""
    echo "public extension FrostedTint {"

    # Discover all unique frosted families (Amber, Blue, etc.) from FrostedColor cases
    frosted_families=""
    for line in "${enum_cases[@]}"; do
        case "$line" in
            "    case frosted"*)
                name=${line#"    case "}
                # Strip any trailing whitespace after the case name
                name=${name%%[[:space:]]*}
                ;;
            *)
                continue
                ;;
        esac

        # Drop 9contrast suffix if present
        case "$name" in
            *9contrast) name=${name%9contrast} ;;
        esac

        # Remove the "frosted" prefix to get the rest (e.g., Amber1, AmberA1)
        rest=${name#frosted}
        base=$rest

        # Remove trailing digits
        while :; do
            case "$base" in
                *[0-9]) base=${base%[0-9]} ;;
                *) break ;;
            esac
        done

        # If the remainder ends with "A", strip it (for A-variants)
        case "$base" in
            *A) family=${base%A} ;;
            *)  family=$base ;;
        esac

        # Deduplicate families
        case " $frosted_families " in
            *" $family "*) ;;
            *) frosted_families="$frosted_families $family" ;;
        esac
    done

    # Helper to check if a specific FrostedColor case exists
    has_whcolor_case() {
        local needle="$1"
        local line
        for line in "${enum_cases[@]}"; do
            case "$line" in
                *" $needle") return 0 ;;
            esac
        done
        return 1
    }

    for Family in $frosted_families; do
        # lowerCamelCase for the static property name (Amber -> amber, BlueGray -> blueGray)
        first_char=$(printf '%s' "$Family" | cut -c1 | tr '[:upper:]' '[:lower:]')
        rest=$(printf '%s' "$Family" | cut -c2-)
        family_lc="${first_char}${rest}"

        # Verify that we have a full palette 1...12, A1...A12, and a 9contrast swatch
        has_all="yes"

        for n in 1 2 3 4 5 6 7 8 9 10 11 12; do
            if ! has_whcolor_case "frosted${Family}${n}"; then
                has_all="no"
            fi
        done

        for n in 1 2 3 4 5 6 7 8 9 10 11 12; do
            if ! has_whcolor_case "frosted${Family}A${n}"; then
                has_all="no"
            fi
        done

        if ! has_whcolor_case "frosted${Family}9contrast"; then
            has_all="no"
        fi

        if [ "$has_all" = "yes" ]; then
            echo ""
            echo "    static let ${family_lc} = FrostedTint("
            echo "        one: Color(FrostedColor.frosted${Family}1),"
            echo "        two: Color(FrostedColor.frosted${Family}2),"
            echo "        three: Color(FrostedColor.frosted${Family}3),"
            echo "        four: Color(FrostedColor.frosted${Family}4),"
            echo "        five: Color(FrostedColor.frosted${Family}5),"
            echo "        six: Color(FrostedColor.frosted${Family}6),"
            echo "        seven: Color(FrostedColor.frosted${Family}7),"
            echo "        eight: Color(FrostedColor.frosted${Family}8),"
            echo "        nine: Color(FrostedColor.frosted${Family}9),"
            echo "        contrastNine: Color(FrostedColor.frosted${Family}9contrast),"
            echo "        ten: Color(FrostedColor.frosted${Family}10),"
            echo "        eleven: Color(FrostedColor.frosted${Family}11),"
            echo "        twelve: Color(FrostedColor.frosted${Family}12),"
            echo "        A1: Color(FrostedColor.frosted${Family}A1),"
            echo "        A2: Color(FrostedColor.frosted${Family}A2),"
            echo "        A3: Color(FrostedColor.frosted${Family}A3),"
            echo "        A4: Color(FrostedColor.frosted${Family}A4),"
            echo "        A5: Color(FrostedColor.frosted${Family}A5),"
            echo "        A6: Color(FrostedColor.frosted${Family}A6),"
            echo "        A7: Color(FrostedColor.frosted${Family}A7),"
            echo "        A8: Color(FrostedColor.frosted${Family}A8),"
            echo "        A9: Color(FrostedColor.frosted${Family}A9),"
            echo "        A10: Color(FrostedColor.frosted${Family}A10),"
            echo "        A11: Color(FrostedColor.frosted${Family}A11),"
            echo "        A12: Color(FrostedColor.frosted${Family}A12)"
            echo "    )"
        fi
    done

    echo "}"
} >> "$OUTPUT_FILE"

echo "Swift file successfully generated at $OUTPUT_FILE"
