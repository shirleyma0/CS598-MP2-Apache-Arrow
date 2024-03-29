// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
// regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import PackageDescription

let package = Package(
    name: "Arrow",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Arrow",
            targets: ["Arrow"]),
    ],
    dependencies: [
        // The latest version of flatbuffers v23.5.26 was built in May 26, 2023
        // and therefore doesn't include the unaligned buffer swift changes.
        // This can be changed back to using the tag once a new version of
        // flatbuffers has been released.
        .package(url: "https://github.com/google/flatbuffers.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Arrow",
            dependencies: [
                .product(name: "FlatBuffers", package: "flatbuffers")
            ]),
        .testTarget(
            name: "ArrowTests",
            dependencies: ["Arrow"]),
    ]
)
