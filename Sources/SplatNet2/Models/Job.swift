public struct Job: Codable {
    public var bossCounts: BossCounts
    public var dangerRate: Double
    public var grade: Grade
    public var gradePoint: Int
    public var gradePointDelta: Int
    public var jobId: Int
    public var jobRate: Int
    public var jobResult: Result
    public var jobScore: Int
    public var kumaPoint: Int
    public var myResult: PlayerResult
    public var otherResults: [PlayerResult]?
    public var playerType: Player.PlayerType
    public var schedule: SalmonRunSchedules.Schedule
    public var waveDetails: [WaveDetails]
    @Timestamp public var playTime: SN2Date
    @Timestamp public var startTime: SN2Date
    @Timestamp public var endTime: SN2Date
}


extension Job {
    
    public typealias BossId = Int
    public typealias BossCounts = [BossId: BossCount]
    
    public struct Grade: Codable {
        public var id: String
        public var name: String
    }
    
    public struct BossCount: Codable {
        public var boss: Boss
        public var count: Int
        
        public struct Boss: Codable {
            public var key: String
            public var name: String
        }
    }
    
    public struct Result: Codable {
        public var failureReason: String?
        public var failureWave: Int?
        public var isClear: Bool
    }
    
    public struct PlayerResult: Codable {
        public var bossKillCounts: BossCounts
        public var deadCount: Int
        public var goldenIkuraNum: Int
        public var helpCount: Int
        public var ikuraNum: Int
        public var name: String
        public var pid: String
        public var playerType: Player.PlayerType
        public var special: Weapon.Equipment
        public var specialCounts: [Int]
        public var weaponList: [SalmonRunSchedules.Schedule.Weapon]
    }
    
    public struct WaveDetails: Codable {
        public var eventType: EventType
        public var goldenIkuraNum: Int
        public var goldenIkuraPopNum: Int
        public var ikuraNum: Int
        public var quotaNum: Int
        public var waterLevel: WaterLevel
        
        public struct WaterLevel: Codable {
            public var key: String
            public var name: String
        }
        public struct EventType: Codable {
            public var key: String
            public var name: String
        }
    }
}
