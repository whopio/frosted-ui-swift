#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT="${1:-$ROOT/.build/xcframework}"
VERSION="${FROSTED_VERSION:-0.0.0}"
mkdir -p "$OUTPUT"
OUTPUT="$(cd "$OUTPUT" && pwd)"

[[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "Expected a numeric release version" >&2; exit 1; }
[[ "${FROSTED_SIGNING_IDENTITY:-}" != "-" ]] || { echo "Ad-hoc signing is not supported" >&2; exit 1; }
xcodegen generate --spec "$ROOT/project-xcframework.yml" --project "$ROOT"

framework_args=()
for platform in ios simulator macos catalyst; do
    case "$platform" in
        ios) destination="generic/platform=iOS" ;;
        simulator) destination="generic/platform=iOS Simulator" ;;
        macos) destination="generic/platform=macOS" ;;
        catalyst) destination="generic/platform=macOS,variant=Mac Catalyst" ;;
    esac
    archive="$OUTPUT/$platform.xcarchive"
    xcodebuild archive -project "$ROOT/FrostedUI.xcodeproj" -scheme FrostedUI \
        -configuration Release -destination "$destination" -archivePath "$archive" \
        -derivedDataPath "$OUTPUT/DerivedData" \
        MARKETING_VERSION="$VERSION" CODE_SIGNING_ALLOWED=NO \
        > "$OUTPUT/$platform.log" 2>&1 || { tail -80 "$OUTPUT/$platform.log"; exit 1; }
    framework="$archive/Products/Library/Frameworks/FrostedUI.framework"
    test -d "$framework/Modules/FrostedUI.swiftmodule"
    test -f "$framework/Resources/Assets.car" || test -f "$framework/Assets.car"
    if [ -n "${FROSTED_SIGNING_IDENTITY:-}" ]; then
        codesign --force --timestamp --sign "$FROSTED_SIGNING_IDENTITY" "$framework"
        codesign --verify --deep --strict "$framework"
    fi
    framework_args+=(-framework "$framework" -debug-symbols "$archive/dSYMs/FrostedUI.framework.dSYM")
    echo "Archived $platform"
done

rm -rf "$OUTPUT/FrostedUI.xcframework"
xcodebuild -create-xcframework "${framework_args[@]}" -output "$OUTPUT/FrostedUI.xcframework"
git -C "$ROOT" rev-parse HEAD > "$OUTPUT/FrostedUI.xcframework/source-revision.txt"
if [ -n "${FROSTED_SIGNING_IDENTITY:-}" ]; then
    codesign --force --timestamp --sign "$FROSTED_SIGNING_IDENTITY" "$OUTPUT/FrostedUI.xcframework"
    codesign --verify --strict "$OUTPUT/FrostedUI.xcframework"
fi
rm -f "$OUTPUT/FrostedUI.xcframework.zip"
(cd "$OUTPUT" && COPYFILE_DISABLE=1 zip -qry FrostedUI.xcframework.zip FrostedUI.xcframework)
swift package compute-checksum "$OUTPUT/FrostedUI.xcframework.zip" > "$OUTPUT/checksum.txt"
echo "Created $OUTPUT/FrostedUI.xcframework.zip"
