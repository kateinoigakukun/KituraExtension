import PackageDescription

let package = Package(
    name: "KituraExtension",
    dependencies: [
      .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 2)
    ],
    exclude: ["Sources/Views"]
)
