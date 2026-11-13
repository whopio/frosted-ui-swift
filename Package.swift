// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "FrostedUI",
    platforms: [.iOS(.v17), .macOS(.v15)],
    products: [.library(name: "FrostedUI", targets: ["FrostedUI"])],
    targets: [
        .binaryTarget(
            name: "FrostedUI",
            url: "https://github.com/whopio/frosted-ui-swift/releases/download/0.9.0/FrostedUI.xcframework.zip",
            checksum: "f30048d0792160f5e3fd680f452185da3a848b606c1f6ae4581f07022a84a7ec"
        ),
    ]
)
