// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ObservableStorage",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "ObservableStorage", targets: ["ObservableStorage"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "ObservableStorage", dependencies: []),
        .testTarget(name: "ObservableStorageTests", dependencies: ["ObservableStorage"]),
    ]
)
