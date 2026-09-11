// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrostedUI",
    platforms: [.iOS(.v17), .macOS(.v15)],
    products: [
        .library(
            name: "FrostedUI",
            type: .dynamic,
            targets: ["FrostedUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.18.0"),
    ],
    targets: [
        .target(
            name: "FrostedUI",
            dependencies: [],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "FrostedUITests",
            dependencies: [
                "FrostedUI",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            exclude: ["__Snapshots__"]
        ),
    ],
    swiftLanguageModes: [.v5]
)
