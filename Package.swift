// swift-tools-version:4.2
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
            name: "Tests",
            dependencies: ["WolfPipe"]),
        ]
)
