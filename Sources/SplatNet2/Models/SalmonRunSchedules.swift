public struct SalmonRunSchedules: Decodable {
    
    public var schedules: [Schedule]
    public var details: [Schedule]
}

extension SalmonRunSchedules {
    
    public struct Schedule: Decodable {
        
        @Timestamp public var startTime: SN2Date
        @Timestamp public var endTime: SN2Date
        public var stage: Stage?
        public var weapons: [Weapon]?
    }
}

extension SalmonRunSchedules.Schedule {
    
    public struct Stage: Decodable {
        public var name: String
        @SN2WebResource public var image: SN2URL
    }
    
    public struct Weapon: Decodable {
        public var id: String
        public var weapon: WeaponDetail?
        public var coopSpecialWeapon: CoopSpecialWeapon?
        
        public struct WeaponDetail: Decodable {
            public var id: String
            public var name: String
            @SN2WebResource public var thumbnail: SN2URL
            @SN2WebResource public var image: SN2URL
        }
        
        public struct CoopSpecialWeapon: Decodable {
            public var name: String
            @SN2WebResource public var image: SN2URL
        }
    }
}
