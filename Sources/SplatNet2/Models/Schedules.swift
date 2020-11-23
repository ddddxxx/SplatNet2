public struct Schedules: Codable {
    public var regular: [Schedule]
    public var gachi: [Schedule]
    public var league: [Schedule]
}

extension Schedules {
    
    public struct Schedule: Codable {
        public var id: Int
        public var stageA: Stage
        public var stageB: Stage
        public var gameMode: GameMode
        @Timestamp public var startTime: SN2Date
        @Timestamp public var endTime: SN2Date
        public var rule: GameRule
    }
}

extension Schedules.Schedule {
    
    public struct GameMode: Codable {
        
        public var key: Key
        public var name: String
        
        public enum Key: String, Codable {
            case regular
            case gachi
            case league
        }
    }
}
