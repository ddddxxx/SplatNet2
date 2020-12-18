import XCTest
import Moya
@testable import SplatNet2
@testable import SplatNet2API

let badAuthProvider = MoyaProvider<SplatNet2API>(plugins: [SplatNet2Auth(iksmSession: "bad session")])
let stubbingProvider = MoyaProvider<SplatNet2API>(stubClosure: MoyaProvider.delayedStub(1))

final class SplatNet2Tests: XCTestCase {
    
    func testBadAuthRequest() {
        let expect = XCTestExpectation()
        badAuthProvider.request(.battleInformation) { result in
            XCTAssertEqual(try? result.get().statusCode, 403)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 10)
    }
    
    func testStubbing() {
        let expect = XCTestExpectation()
        stubbingProvider.request(.nicknameAndIcon(id: "foo")) { result in
            XCTAssertNoThrow({ try result.get().map(NicknameAndIcon.self) })
            expect.fulfill()
        }
        wait(for: [expect], timeout: 10)
    }

    static var allTests = [
        ("testRequest", testBadAuthRequest),
    ]
}
