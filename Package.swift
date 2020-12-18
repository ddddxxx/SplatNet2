// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SplatNet2",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "SplatNet2",
            targets: ["SplatNet2", "SplatNet2API"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya", from: "14.0.0"),
    ],
    targets: [
        .target(
            name: "SplatNet2",
            dependencies: []),
        .target(
            name: "SplatNet2API",
            dependencies: [
                "SplatNet2",
                .product(name: "Moya", package: "Moya", condition: .when(platforms: [.iOS, .macOS, .tvOS, .watchOS])),
            ]),
        .testTarget(
            name: "SplatNet2Tests",
            dependencies: ["SplatNet2", "SplatNet2API"]),
    ]
)
