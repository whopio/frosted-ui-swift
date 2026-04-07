// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrostedUI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "FrostedUI",
            type: .dynamic,
            targets: ["FrostedUI"]),
    ],
    targets: [
        .target(
            name: "FrostedUI",
            dependencies: [],
            resources: [.process("Resources")]
        ),
    ]
)
