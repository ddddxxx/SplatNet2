#if canImport(Moya)

import XCTest
import Moya
import SplatNet2
import SplatNet2API

let badAuthProvider = MoyaProvider<SplatNet2API>(plugins: [SplatNet2Auth(iksmSession: "bad session")])
let stubbingProvider = MoyaProvider<SplatNet2API>(stubClosure: MoyaProvider.delayedStub(0.1))

final class SplatNet2APITests: XCTestCase {
    
    func testBadAuthRequest() {
        let expect = XCTestExpectation()
        badAuthProvider.request(.battleInformation) { result in
            XCTAssertEqual(try? result.get().statusCode, 403)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 10)
    }
    
    func request<T: Decodable>(_ target: SplatNet2API, decodeAs: T.Type, body: @escaping (T) -> Void) {
        let expect = XCTestExpectation(description: "request \(target)")
        stubbingProvider.request(target) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(decodeAs, using: decoder)
                body(obj)
            }
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
    }
    
    func testBattleInformation() {
        request(.battleInformation, decodeAs: BattleOverview.self) { obj in
            XCTAssertEqual(obj.results.count, 50)
        }
    }
    
    func testBattleResult() {
        request(.result(battleNumber: "42"), decodeAs: Battle.self) { obj in
            XCTAssertEqual(obj.battleNumber, "6688")
        }
    }
    
    func testSchedules() {
        request(.schedules, decodeAs: Schedules.self) { obj in
            XCTAssertEqual(obj.regular.count, 12)
            XCTAssertEqual(obj.gachi.count, 12)
            XCTAssertEqual(obj.league.count, 12)
        }
    }
    
    func testSalmonRunSchedules() {
        request(.salmonRunSchedules, decodeAs: SalmonRunSchedules.self) { obj in
            XCTAssertEqual(obj.schedules.count, 5)
            XCTAssertEqual(obj.details.count, 2)
        }
    }
    
    func testRecords() {
        request(.records, decodeAs: Records.self) { obj in
            XCTAssertEqual(obj.records.player.playerRank, 5)
        }
    }
    
    func testNicknameAndIcon() {
        request(.nicknameAndIcon(id: "foo"), decodeAs: NicknameAndIcon.self) { obj in
            XCTAssertEqual(obj.nicknameAndIcons.count, 1)
            XCTAssertEqual(obj.nicknameAndIcons[0].nickname, "Zeke")
        }
    }
    
    func testActiveFestivals() {
        request(.activeFestivals, decodeAs: ActiveFestivals.self) { obj in
            XCTAssertEqual(obj.festivals.count, 1)
            XCTAssertEqual(obj.festivals[0].names.alphaShort, "Trick")
        }
    }
}

#endif // canImport(Moya)
