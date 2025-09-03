
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "EmptyStateKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "EmptyStateKit", targets: ["EmptyStateKit"]),
    ],
    targets: [
        .target(name: "EmptyStateKit", path: "Sources/EmptyStateKit"),
        .testTarget(name: "EmptyStateKitTests", path: "Tests/EmptyStateKitTests")
    ]
)
