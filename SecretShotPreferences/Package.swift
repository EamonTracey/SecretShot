// swift-tools-version:5.2

import PackageDescription
import Foundation

let theosPath = ProcessInfo.processInfo.environment["THEOS"]!

let libFlags: [String] = [
    "-F\(theosPath)/vendor/lib", "-F\(theosPath)/lib",
    "-I\(theosPath)/vendor/include", "-I\(theosPath)/include"
]

let cFlags: [String] = libFlags + ["-Wno-unused-command-line-argument", "-Qunused-arguments"]

let package = Package(
    name: "SecretShotPreferences",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "SecretShotPreferences",
            targets: ["SecretShotPreferences"]
        ),
    ],
    targets: [
        .target(
            name: "SecretShotPreferencesC",
            cSettings: [.unsafeFlags(cFlags)]
        ),
        .target(
            name: "SecretShotPreferences",
            dependencies: ["SecretShotPreferencesC"],
            swiftSettings: [.unsafeFlags(libFlags)]
        )
    ]
)
