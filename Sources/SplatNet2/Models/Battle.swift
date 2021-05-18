public struct Battle: Codable {
    
    public var battleNumber: String
    public var type: BattleType
    public var stage: Stage
    public var gameMode: GameMode
    public var rule: GameRule
    public var udemae: Udemae?
    public var myTeamResult: TeamResult
    public var otherTeamResult: TeamResult
    public var leaguePoint: Double?
    public var maxLeaguePoint: Double?
    public var myEstimateLeaguePoint: Int?
    public var otherEstimateLeaguePoint: Int?
    public var estimateGachiPower: Int?
    public var myTeamPercentage: Double?
    public var otherTeamPercentage: Double?
    public var xPower: Double?
    public var estimateXPower: Int?
    public var rank: Int?
    public var myTeamCount: Int?
    public var otherTeamCount: Int?
    public var playerResult: TeamMember
    public var myTeamMembers: [TeamMember]?
    public var otherTeamMembers: [TeamMember]?
    public var crownPlayers: [String]?
    @Timestamp public var startTime: SN2Date

    public enum BattleType: String, Codable {
        case regular
        case gachi
        case league
        case fes
        case `private`
    }
}
