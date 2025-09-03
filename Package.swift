
import PackageDescription


let package = Package(
    name: "EmptyStateKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "EmptyStateKit", targets: ["EmptyStateKit"])
    ],
    targets: [
        .target(name: "EmptyStateKit"),
        .testTarget(name: "EmptyStateKitTests", dependencies: ["EmptyStateKit"])
    ]
)
