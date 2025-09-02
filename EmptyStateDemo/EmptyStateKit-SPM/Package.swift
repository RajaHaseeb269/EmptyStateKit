// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "EmptyStateKit",
    platforms: [.iOS("13.0")],
    products: [
        // Consumers will import `EmptyStateKit`
        .library(name: "EmptyStateKit", targets: ["EmptyStateKit"])
    ],
    targets: [
        // Keep your current folder name but expose the module name `EmptyStateKit`
        .target(name: "EmptyStateKit", path: "Sources/EmptyStateKit-SPM")
        // (You can add tests later)
    ]
)

