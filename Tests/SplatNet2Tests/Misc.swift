import XCTest

func AssertNoThrow(_ expression: () throws -> Void, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) {
    XCTAssertNoThrow(try expression(), message(), file: file, line: line)
}
