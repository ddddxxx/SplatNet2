public struct Records: Codable {
    public var records: Records
}

extension Records {
    
    public struct Records: Codable {
        public var player: Player
        public var leagueStats: LeagueStats
        
        public struct LeagueStats: Codable {
            public var pair: Stat
            public var team: Stat
            
            public struct Stat: Codable {
                public var bronzeCount: Int
                public var silverCount: Int
                public var goldCount: Int
                public var noMedalCount: Int
            }
        }
    }
}
