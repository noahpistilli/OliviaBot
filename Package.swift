// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OliviaBot",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(url: "https://github.com/SketchMaster2001/Sword", branch: "master"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.4")
    ],
    targets: [
        .target(
            name: "OliviaBot",
            dependencies: ["Sword", "SwiftSoup"]),
    ]
)
