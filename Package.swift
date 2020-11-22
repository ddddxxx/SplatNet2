// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SplatNet2",
    products: [
        .library(
            name: "SplatNet2",
            targets: ["SplatNet2"]),
    ],
    targets: [
        .target(
            name: "SplatNet2",
            dependencies: []),
        .testTarget(
            name: "SplatNet2Tests",
            dependencies: ["SplatNet2"]),
    ]
)
