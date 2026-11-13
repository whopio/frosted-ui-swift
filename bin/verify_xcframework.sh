#!/bin/bash
set -euo pipefail

FRAMEWORK="${1:?XCFramework path required}"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
cp -R "$FRAMEWORK" "$WORK/FrostedUI.xcframework"
find "$WORK/FrostedUI.xcframework" -type f -name '*.swiftmodule' -delete
FRAMEWORK="$WORK/FrostedUI.xcframework"

cat > "$WORK/Consumer.swift" <<'SWIFT'
import FrostedUI
import SwiftUI

struct Consumer: View {
    var body: some View {
        VStack {
            Image(FrostedIcon.plus16)
            Image(FrostedBrandAsset.beakerGreen)
            Text("Frosted").frostedText(size: .three, weight: .medium)
            Button("Continue") {}.buttonStyle(.frosted(size: .three, color: .gray))
        }
    }
}
SWIFT

for target in arm64-apple-ios17.0 arm64-apple-ios17.0-simulator x86_64-apple-ios17.0-simulator arm64-apple-macos15.0 x86_64-apple-macos15.0; do
    case "$target" in
        *simulator) sdk=iphonesimulator; slice=ios-arm64_x86_64-simulator ;;
        *macos*) sdk=macosx; slice=macos-arm64_x86_64 ;;
        *) sdk=iphoneos; slice=ios-arm64 ;;
    esac
    xcrun swiftc -typecheck "$WORK/Consumer.swift" -target "$target" \
        -sdk "$(xcrun --sdk "$sdk" --show-sdk-path)" -F "$FRAMEWORK/$slice"
    echo "Verified consumer: $target"
done
