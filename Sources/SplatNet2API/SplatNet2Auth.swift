#if canImport(Moya)

import Foundation
import Moya

public struct SplatNet2Auth: PluginType {
    
    public let iksmSession: String
    
    public init(iksmSession: String) {
        self.iksmSession = iksmSession
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.addValue("iksm_session=" + iksmSession, forHTTPHeaderField: "Cookie")
        return request
    }
}

#endif // canImport(Moya)
