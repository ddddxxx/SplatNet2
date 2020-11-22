public struct TeamResult: Decodable {
    public var key: Key
    public var name: String
    
    public enum Key: String, Decodable {
        case victory
        case defeat
    }
}
