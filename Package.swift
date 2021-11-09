// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NanoSubscriptions",
    platforms: [ .iOS(.v11), .macOS(.v11) ],
    products: [
        .library(name: "NanoSubscriptions", targets: [ "NanoSubscriptions" ]),
    ],
    targets: [
        .target(name: "NanoSubscriptions", dependencies: [], path: "Sources"),
        .testTarget(name: "NanoSubscriptionsTests", dependencies: [ "NanoSubscriptions" ], path: "Tests/NanoSubscriptions"),
    ],
    swiftLanguageVersions: [.v5]
)
