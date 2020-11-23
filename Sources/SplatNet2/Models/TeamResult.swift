public struct TeamResult: Codable {
    public var key: Key
    public var name: String
    
    public enum Key: String, Codable {
        case victory
        case defeat
    }
}
