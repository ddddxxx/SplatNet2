import Foundation

@propertyWrapper
public struct Timestamp {
    
    let timestamp: TimeInterval
    
    public var wrappedValue: Date {
        Date(timeIntervalSince1970: timestamp)
    }
}

extension Timestamp: Decodable {
    
    public init(from decoder: Decoder) throws {
        timestamp = try decoder.singleValueContainer().decode(Double.self)
    }
}
