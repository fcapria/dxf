// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "dxf",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(
            name: "dxf",
            path: "Sources"
        ),
    ]
)
