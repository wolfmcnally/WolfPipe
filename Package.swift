// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WolfPipe",
    platforms: [
        .iOS(.v9), .macOS(.v10_13), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WolfPipe",
            type: .dynamic,
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
