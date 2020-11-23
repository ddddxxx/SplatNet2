public struct Schedules: Decodable {
    public var regular: [Schedule]
    public var gachi: [Schedule]
    public var league: [Schedule]
}

extension Schedules {
    
    public struct Schedule: Decodable {
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
    
    public struct GameMode: Decodable {
        
        public var key: Key
        public var name: String
        
        public enum Key: String, Decodable {
            case regular
            case gachi
            case league
        }
    }
}
