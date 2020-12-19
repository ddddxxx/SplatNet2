#if canImport(Moya)

import XCTest
import Moya
import SplatNet2
import SplatNet2API

let badAuthProvider = MoyaProvider<SplatNet2API>(plugins: [SplatNet2Auth(iksmSession: "bad session")])
let stubbingProvider = MoyaProvider<SplatNet2API>(stubClosure: MoyaProvider.delayedStub(1))

final class SplatNet2APITests: XCTestCase {
    
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
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(NicknameAndIcon.self, using: decoder)
                XCTAssertEqual(obj.nicknameAndIcons.count, 1)
                XCTAssertEqual(obj.nicknameAndIcons[0].nickname, "Zeke")
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 10)
    }
}

#endif // canImport(Moya)
