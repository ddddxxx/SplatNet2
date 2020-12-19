public protocol IndirectAccessor {
    
    associatedtype Input
    associatedtype Output
    
    static func access(_ input: Input) -> Output
}

public enum IndirectAccessors {}

@propertyWrapper
public struct IndirectValue<Accessor: IndirectAccessor> {
    
    private let rawValue: Accessor.Input
    
    public var wrappedValue: Accessor.Output {
        Accessor.access(rawValue)
    }
    
    public var projectedValue: Accessor.Input {
        return rawValue
    }
}

extension IndirectValue: Encodable where Accessor.Input: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

extension IndirectValue: Decodable where Accessor.Input: Decodable {
    
    public init(from decoder: Decoder) throws {
        rawValue = try decoder.singleValueContainer().decode(Accessor.Input.self)
    }
}
