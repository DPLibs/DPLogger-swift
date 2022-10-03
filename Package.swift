// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPLogger",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "DPLogger",
            targets: ["DPLogger"]
        )
    ],
    targets: [
        .target(
            name: "DPLogger",
            path: "Sources"
        )
    ]
)
