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

for target in arm64-apple-ios17.0 arm64-apple-ios17.0-simulator x86_64-apple-ios17.0-simulator arm64-apple-macos15.0 x86_64-apple-macos15.0 arm64-apple-ios17.0-macabi x86_64-apple-ios17.0-macabi; do
    case "$target" in
        *simulator) sdk=iphonesimulator; slice=ios-arm64_x86_64-simulator ;;
        *macabi) sdk=macosx; slice=ios-arm64_x86_64-maccatalyst ;;
        *macos*) sdk=macosx; slice=macos-arm64_x86_64 ;;
        *) sdk=iphoneos; slice=ios-arm64 ;;
    esac
    sdk_path="$(xcrun --sdk "$sdk" --show-sdk-path)"
    search_paths=(-F "$FRAMEWORK/$slice")
    if [[ "$target" == *macabi ]]; then
        search_paths+=(-Fsystem "$sdk_path/System/iOSSupport/System/Library/Frameworks")
    fi
    xcrun swiftc -typecheck "$WORK/Consumer.swift" -target "$target" \
        -sdk "$sdk_path" "${search_paths[@]}"
    echo "Verified consumer: $target"
done
