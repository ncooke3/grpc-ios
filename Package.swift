// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

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
        path: "../../Downloads/Firebase 2/FirebaseFirestore/gRPC-Core.xcframework"
    ),
    .binaryTarget(
        name: "gRPC-C++",
        path: "../../Downloads/Firebase 2/FirebaseFirestore/gRPC-C++.xcframework"
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
