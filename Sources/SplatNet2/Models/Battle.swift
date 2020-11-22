public struct Battle: Decodable {
    
    public var battleNumber: String
    public var type: BattleType
    public var stage: Stage
    public var gameMode: GameMode
    public var rule: GameRule
    public var myTeamResult: TeamResult
    public var otherTeamResult: TeamResult
    public var myEstimateLeaguePoint: Int?
    public var otherEstimateLeaguePoint: Int?
    public var estimateGachiPower: Int?
    public var myTeamPercentage: Double?
    public var otherTeamPercentage: Double?
    public var myTeamCount: Int?
    public var otherTeamCount: Int?
    public var playerResult: TeamMember
    public var myTeamMembers: [TeamMember]?
    public var otherTeamMembers: [TeamMember]?
    @Timestamp public var startTime: Date

    public enum BattleType: String, Decodable {
        case regular
        case gachi
        case league
        case fes
        case `private`
    }
}

public extension Battle {
    
    var myPower: Int? {
        myEstimateLeaguePoint ?? estimateGachiPower
    }
    
    var otherPower: Int? {
        otherEstimateLeaguePoint
    }
    
    var myPoint: Double {
        if rule.key == .turfWar {
            return myTeamPercentage!
        } else {
            return Double(myTeamCount!)
        }
    }
    
    var otherPoint: Double {
        if rule.key == .turfWar {
            return otherTeamPercentage!
        } else {
            return Double(otherTeamCount!)
        }
    }
}
