// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AWatchConnectivity",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "AWatchConnectivity",
            targets: [
                "AWatchConnectivity"
            ]
        )
    ],
    targets: [
        .target(
            name: "AWatchConnectivity",
            path: "AWatchConnectivity",
            exclude:[
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "AWatchConnectivityUnitTesting",
            dependencies: ["AWatchConnectivity"],
            path: "AWatchConnectivityUnitTesting"
        )
    ]
)
