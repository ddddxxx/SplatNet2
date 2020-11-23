public struct SalmonRunSchedules: Codable {
    
    public var schedules: [Schedule]
    public var details: [Schedule]
}

extension SalmonRunSchedules {
    
    public struct Schedule: Codable {
        
        @Timestamp public var startTime: SN2Date
        @Timestamp public var endTime: SN2Date
        public var stage: Stage?
        public var weapons: [Weapon]?
    }
}

extension SalmonRunSchedules.Schedule {
    
    public struct Stage: Codable {
        public var name: String
        @SN2WebResource public var image: SN2URL
    }
    
    public struct Weapon: Codable {
        public var id: String
        public var weapon: WeaponDetail?
        public var coopSpecialWeapon: CoopSpecialWeapon?
        
        public struct WeaponDetail: Codable {
            public var id: String
            public var name: String
            @SN2WebResource public var thumbnail: SN2URL
            @SN2WebResource public var image: SN2URL
        }
        
        public struct CoopSpecialWeapon: Codable {
            public var name: String
            @SN2WebResource public var image: SN2URL
        }
    }
}
