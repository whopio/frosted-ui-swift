// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "FrostedUI",
    platforms: [.iOS(.v17), .macOS(.v15)],
    products: [.library(name: "FrostedUI", targets: ["FrostedUI"])],
    targets: [
        .binaryTarget(
            name: "FrostedUI",
            url: "https://github.com/whopio/frosted-ui-swift/releases/download/0.9.1/FrostedUI.xcframework.zip",
            checksum: "8799cbe8034fe797cd5a576c4285e03ccec671b5400ee6bdff66451780b0f4bd"
        ),
    ]
)
