import XCTest
@testable import KituraExtension

class KituraExtensionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(KituraExtension().text, "Hello, World!")
    }

    func testRouting() {
    }


    static var allTests : [(String, (KituraExtensionTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
