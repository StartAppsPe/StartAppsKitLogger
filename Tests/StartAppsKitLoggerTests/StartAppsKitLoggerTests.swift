import XCTest
@testable import StartAppsKitLogger

class StartAppsKitLoggerTests: XCTestCase {
    
    func testLogInfo() {
        Log.info("Tester","Here is some value","Another value")
    }

    static var allTests : [(String, (StartAppsKitLoggerTests) -> () throws -> Void)] {
        return [
            ("testLogInfo", testLogInfo),
        ]
    }
    
}
