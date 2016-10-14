import XCTest
@testable import StartAppsKitLogger

class StartAppsKitLoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(StartAppsKitLogger().text, "Hello, World!")
    }


    static var allTests : [(String, (StartAppsKitLoggerTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
