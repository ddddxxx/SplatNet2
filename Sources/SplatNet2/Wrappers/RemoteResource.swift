import Foundation

public protocol RemoteResourceHost {
    static var host: URL { get }
}

@propertyWrapper
public struct RemoteResource<Host: RemoteResourceHost> {
    
    let path: String
    
    public var wrappedValue: URL {
        Host.host.appendingPathComponent(path)
    }
}

extension RemoteResource: Decodable {
    
    public init(from decoder: Decoder) throws {
        path = try decoder.singleValueContainer().decode(String.self)
    }
}
