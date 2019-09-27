// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "WolfPipe",
    platforms: [
        .iOS(.v9), .macOS(.v10_13), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WolfPipe",
            targets: ["WolfPipe"]),
        ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "WolfPipe",
            dependencies: []),
        .testTarget(
            name: "WolfPipeTests",
            dependencies: ["WolfPipe"]),
        ]
)
