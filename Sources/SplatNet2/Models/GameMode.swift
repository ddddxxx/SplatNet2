public struct GameMode: Decodable {
    
    public var key: Key
    public var name: String
    
    public enum Key: String, Decodable {
        case regular
        case leaguePair = "league_pair"
        case leagueTeam = "league_team"
        case gachi
        case fesTeam = "fes_team"
        case fesSolo = "fes_solo"
        case `private`
    }
}
