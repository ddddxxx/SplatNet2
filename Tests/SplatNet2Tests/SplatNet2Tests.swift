import XCTest
import SplatNet2

final class SplatNet2Tests: XCTestCase {
    
    func testPropertyWrapper() throws {
        let json = #"{"id":"foo","name":"bar","image":"baz"}"#.data(using: .utf8)!
        let obj = try JSONDecoder().decode(Stage.self, from: json)
        XCTAssertEqual(obj.id, "foo")
        XCTAssertEqual(obj.name, "bar")
        XCTAssertEqual(obj.$image, "baz")
        XCTAssertEqual(obj.image, URL(string: "https://app.splatoon2.nintendo.net/baz")!)
    }
}
