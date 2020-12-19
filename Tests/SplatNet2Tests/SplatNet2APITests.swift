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
        let battleInformationExpect = XCTestExpectation(description: "Request battleInformation")
        stubbingProvider.request(.battleInformation) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(BattleOverview.self, using: decoder)
                XCTAssertEqual(obj.results.count, 50)
            }
            battleInformationExpect.fulfill()
        }
        
        let resultExpect = XCTestExpectation(description: "Request result")
        stubbingProvider.request(.result(battleNumber: "6688")) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(Battle.self, using: decoder)
                XCTAssertEqual(obj.battleNumber, "6688")
            }
            resultExpect.fulfill()
        }
        
        let schedulesExpect = XCTestExpectation(description: "Request schedules")
        stubbingProvider.request(.schedules) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(Schedules.self, using: decoder)
                XCTAssertEqual(obj.regular.count, 12)
                XCTAssertEqual(obj.gachi.count, 12)
                XCTAssertEqual(obj.league.count, 12)
            }
            schedulesExpect.fulfill()
        }
        
        let salmonRunSchedulesExpect = XCTestExpectation(description: "Request salmonRunSchedules")
        stubbingProvider.request(.salmonRunSchedules) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(SalmonRunSchedules.self, using: decoder)
                XCTAssertEqual(obj.schedules.count, 5)
                XCTAssertEqual(obj.details.count, 2)
            }
            salmonRunSchedulesExpect.fulfill()
        }
        
        let recordsExpect = XCTestExpectation(description: "Request records")
        stubbingProvider.request(.records) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let _ = try result.get().map(Records.self, using: decoder)
            }
            recordsExpect.fulfill()
        }
        
        let nicknameAndIconExpect = XCTestExpectation(description: "Request nicknameAndIcon")
        stubbingProvider.request(.nicknameAndIcon(id: "foo")) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let obj = try result.get().map(NicknameAndIcon.self, using: decoder)
                XCTAssertEqual(obj.nicknameAndIcons.count, 1)
                XCTAssertEqual(obj.nicknameAndIcons[0].nickname, "Zeke")
            }
            nicknameAndIconExpect.fulfill()
        }
        
        let activeFestivalsExpect = XCTestExpectation(description: "Request activeFestivals")
        stubbingProvider.request(.activeFestivals) { result in
            AssertNoThrow {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let _ = try result.get().map(ActiveFestivals.self, using: decoder)
            }
            activeFestivalsExpect.fulfill()
        }
        
        wait(for: [
            battleInformationExpect,
            resultExpect,
            schedulesExpect,
            salmonRunSchedulesExpect,
            recordsExpect,
            nicknameAndIconExpect,
            activeFestivalsExpect,
        ], timeout: 10)
    }
}

#endif // canImport(Moya)
