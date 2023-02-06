// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let version = "0.0.2"

let package = Package(
  name: "gRPC",
  products: [
    .library(
      name: "gRPC-Core",
      targets: [
        "gRPC-Core",
      ]
    ),
    .library(
      name: "gRPC-C++",
      targets: [
        "gRPC-CPP-Target",
      ]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/ncooke3/abseil-cpp-SwiftPM.git", .exact("0.0.2"))
  ],
  targets: [
    .target(
        name: "gRPC-CPP-Target",
        dependencies: [
            .target(name: "gRPC-CPP-Wrapper")
        ],
		path: "SwiftPM-PlatformExclude/gRPC-CPP-Wrap"
    ),
    .target(
        name: "gRPC-CPP-Wrapper",
        dependencies: [
            .target(name: "gRPC-Core"),
            .target(name: "gRPC-C++"),
            .product(name: "abseil", package: "abseil-cpp-swiftPM")
        ],
        path: "gRPC-CPP-Wrapper"
    ),
    .binaryTarget(
        name: "gRPC-Core",
        url: "https://github.com/ncooke3/grpc-ios/releases/download/\(version)/gRPC-Core.zip",
        checksum: "c2ef0601edf532a8bbdf77c3a10c2f16417814fff1275e7a873287099d3528bb"
    ),
    .binaryTarget(
        name: "gRPC-C++",
        url: "https://github.com/ncooke3/grpc-ios/releases/download/\(version)/gRPC-C++.zip",
        checksum: "3c0b76aa3a6a2a7a9ca1a1db783f527c90855d31b9fbb9c58e31ec5e4d8e2f36"
    ),
    .testTarget(
      name: "build-test",
      dependencies: [
        "gRPC-C++",
      ],
      path: "native/test/spm_build"
    ),
  ],
  cLanguageStandard: .gnu11,
  cxxLanguageStandard: .cxx14
)
