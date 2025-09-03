// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "EmptyStateKit",
   // platforms: [.iOS("13.0")],
    platforms: [.iOS("14.0")],
    products: [
        .library(name: "EmptyStateKit", targets: ["EmptyStateKit"])
    ],
    targets: [
        // default path = Sources/<target-name> = Sources/EmptyStateKit
        .target(name: "EmptyStateKit")
    ]
)



