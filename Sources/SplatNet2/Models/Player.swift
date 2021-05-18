public struct Player: Codable {
    
    public var principalId: String
    public var nickname: String
    public var playerRank: Int
    public var starRank: Int
    public var weapon: Weapon
    public var udemae: Udemae?
    public var udemaeZones: Udemae?
    public var udemaeRainmaker: Udemae?
    public var udemaeTower: Udemae?
    public var udemaeClam: Udemae?
    public var headSkills: ClothingSkill
    public var clothesSkills: ClothingSkill
    public var shoesSkills: ClothingSkill
    public var playerType: PlayerType
    public var head: Gear
    public var clothes: Gear
    public var shoes: Gear
    public var maxLeaguePointTeam: Double?
    public var maxLeaguePointPair: Double?
    
    public struct ClothingSkill: Codable {
        public var main: Skill
        public var subs: [Skill?]
        
        public struct Skill: Codable {
            public var id: String
            public var name: String
            @SN2WebResource public var image: SN2URL
        }
    }
    
    public struct PlayerType: Codable {
        public var style: Style
        public var species: Species
        
        public enum Style: String, Codable {
            case boy, girl
        }
        
        public enum Species: String, Codable {
            case inklings, octolings
        }
    }
}
