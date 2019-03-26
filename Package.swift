// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "WolfPipe",
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
