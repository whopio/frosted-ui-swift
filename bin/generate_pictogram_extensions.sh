#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ASSETS_PATH="$ROOT_DIR/Sources/FrostedUI/Resources/Pictograms.xcassets"
OUTPUT_FILE="$ROOT_DIR/Sources/FrostedUI/Pictograms/Pictogram+Extensions.swift"

if [ ! -d "$ASSETS_PATH" ]; then
    echo "Error: pictogram asset catalog '$ASSETS_PATH' does not exist." >&2
    exit 1
fi

mkdir -p "$(dirname "$OUTPUT_FILE")"

pictogram_names=()
while IFS= read -r name; do
    pictogram_names+=("$name")
done < <(
    find "$ASSETS_PATH" -mindepth 1 -maxdepth 1 -type d -name '*.imageset' ! -name '*Orange.imageset' \
        -exec basename {} .imageset \; | sort
)

if [ "${#pictogram_names[@]}" -eq 0 ]; then
    echo "Error: no pictogram imagesets found in '$ASSETS_PATH'." >&2
    exit 1
fi

for name in "${pictogram_names[@]}"; do
    if [ ! -d "$ASSETS_PATH/${name}Orange.imageset" ]; then
        echo "Error: missing orange variant for '$name'." >&2
        exit 1
    fi
done

{
    cat <<'SWIFT'
import SwiftUI

/// A full-color illustration from the Frosted Design System.
public enum FrostedPictogram: String, CaseIterable, Identifiable, Sendable {
    public var id: String { rawValue }

SWIFT

    for name in "${pictogram_names[@]}"; do
        echo "    case $name"
    done

    cat <<'SWIFT'
}

/// Selects the surface a pictogram is drawn over.
public enum FrostedPictogramVariant: Sendable {
    /// Uses the light asset and automatically switches to its dark appearance.
    case automatic
    /// Uses the variant designed for an orange surface.
    case orange
}

private extension FrostedPictogram {
    func assetName(for variant: FrostedPictogramVariant) -> String {
        switch variant {
        case .automatic:
            rawValue
        case .orange:
            "\(rawValue)Orange"
        }
    }
}

public extension Image {
    init(_ pictogram: FrostedPictogram, variant: FrostedPictogramVariant = .automatic) {
        self.init(pictogram.assetName(for: variant), bundle: .module)
    }
}

public extension UIImage {
    convenience init?(_ pictogram: FrostedPictogram, variant: FrostedPictogramVariant = .automatic) {
        self.init(named: pictogram.assetName(for: variant), in: .module, compatibleWith: nil)
    }
}
SWIFT
} > "$OUTPUT_FILE"

echo "Generated ${#pictogram_names[@]} FrostedPictogram cases in $OUTPUT_FILE."
