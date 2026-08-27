// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-sample-order",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Sample Order",
            targets: ["Sample Order"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-sample.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-order.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Sample Order",
            dependencies: [
                .product(name: "Sample", package: "swift-sample"),
                .product(name: "Order", package: "swift-order"),
            ]
        ),
        .testTarget(
            name: "Sample Order Tests",
            dependencies: ["Sample Order"],
            path: "Tests/Sample Order Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
