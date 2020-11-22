public struct Player: Decodable {
    
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
    
    public struct Udemae: Decodable {
        public var name: String?
        public var sPlusNumber: Int?
        public var isX: Bool
        public var number: Int?
        public var isNumberReached: Bool?
    }
    
    public struct ClothingSkill: Decodable {
        public var main: Skill
        public var subs: [Skill?]
        
        public struct Skill: Decodable {
            public var id: String
            public var name: String
            @SN2RemoteResource public var image: URL
        }
    }
}