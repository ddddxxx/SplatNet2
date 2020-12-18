import XCTest
import Moya
@testable import SplatNet2
@testable import SplatNet2API

final class SplatNet2Tests: XCTestCase {
    
    func testRequest() {
        let auth = SplatNet2Auth(iksmSession: "bad session")
        let provider = MoyaProvider<SplatNet2API>(plugins: [auth])
        let expect = XCTestExpectation()
        provider.request(.battleInformation) { result in
            XCTAssertEqual(try? result.get().statusCode, 403)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 10)
    }

    static var allTests = [
        ("testRequest", testRequest),
    ]
}
