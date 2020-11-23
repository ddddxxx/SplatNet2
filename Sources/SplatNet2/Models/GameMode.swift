public struct GameMode: Codable {
    
    public var key: Key
    public var name: String
    
    public enum Key: String, Codable {
        case regular
        case leaguePair = "league_pair"
        case leagueTeam = "league_team"
        case gachi
        case fesTeam = "fes_team"
        case fesSolo = "fes_solo"
        case `private`
    }
}
