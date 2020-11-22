public struct GameRule: Decodable {
    
    public var key: Key
    public var name: String
    public var multilineName: String
    
    public enum Key: String, Decodable {
        case turfWar = "turf_war"
        case splatZones = "splat_zones"
        case towerControl = "tower_control"
        case rainmaker
        case clamBlitz = "clam_blitz"
    }
}
