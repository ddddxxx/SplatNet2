public struct JobOverview: Codable {
    public var summary: Summary
    public var rewardGear: RewardGear
    public var results: [Job]
}

extension JobOverview {
    
    public struct Summary: Codable {
        public var card: Card
        public var stats: [Stats]
    }
    
    public struct RewardGear: Codable {
        public var id: String
        public var name: String
        public var kind: String
        public var brand: Brand
        public var rarity: Int
        @SN2WebResource public var thumbnail: SN2URL
        @SN2WebResource public var image: SN2URL
    }
}

extension JobOverview.Summary {
    
    public struct Card: Codable {
        public var goldenIkuraTotal: Int
        public var helpTotal: Int
        public var ikuraTotal: Int
        public var jobNum: Int
        public var kumaPoint: Int
        public var kumaPointTotal: Int
    }
    
    public struct Stats: Codable {
        public var clearNum: Int
        public var deadTotal: Int
        public var failureCounts: [Int]
        public var grade: Job.Grade
        public var gradePoint: Int
        public var helpTotal: Int
        public var jobNum: Int
        public var kumaPointTotal: Int
        public var myGoldenIkuraTotal: Int
        public var myIkuraTotal: Int
        public var schedule: SalmonRunSchedules.Schedule
        public var teamGoldenIkuraTotal: Int
        public var teamIkuraTotal: Int
        @Timestamp public var startTime: SN2Date
        @Timestamp public var endTime: SN2Date
    }
}

extension JobOverview.RewardGear {
    
    public struct Brand: Codable {
        public var id: String
        public var name: String
        @SN2WebResource public var image: SN2URL
    }
}
