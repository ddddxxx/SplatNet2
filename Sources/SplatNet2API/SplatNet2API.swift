#if canImport(Moya)

import Foundation
import SplatNet2
import Moya

public enum SplatNet2API {
    case battleInformation
    case result(battleNumber: String)
    case schedules
    case salmonRunSchedules
    case records
    case nicknameAndIcon(id: String)
    case activeFestivals
}

extension SplatNet2API: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://app.splatoon2.nintendo.net")!
    }
    
    public var path: String {
        switch self {
        case .battleInformation:
            return "/results"
        case .result(let battleNumber):
            return "/results/\(battleNumber)"
        case .schedules:
            return "/schedules"
        case .salmonRunSchedules:
            return "/coop_schedules"
        case .records:
            return "/records"
        case .nicknameAndIcon:
            return "/nickname_and_icon"
        case .activeFestivals:
            return "/festivals/active"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .nicknameAndIcon(let id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    public var sampleData: Data {
        guard let fileName = sampleDataFileName else {
            return Data()
        }
        let url = Bundle.module.url(forResource: "SN2SampleData/\(fileName)", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
}

private extension SplatNet2API {
    
    var sampleDataFileName: String? {
        switch self {
        case .battleInformation:
            return "results"
        case .result:
            return "result"
        case .schedules:
            return "schedules"
        case .salmonRunSchedules:
            return "coop_schedules"
        case .records:
            return "records"
        case .nicknameAndIcon:
            return "nickname_and_icon"
        case .activeFestivals:
            return "festivals_active"
        }
    }
}

#endif // canImport(Moya)
