public struct SalmonRunSchedules: Decodable {
    
    public var schedules: [Schedule]
    public var details: [Schedule]
}

extension SalmonRunSchedules {
    
    public struct Schedule: Decodable {
        
        @Timestamp public var startTime: Date
        @Timestamp public var endTime: Date
        public var stage: Stage?
        public var weapons: [Weapon]?
    }
}

extension SalmonRunSchedules.Schedule {
    
    public struct Stage: Decodable {
        public var name: String
        @SN2RemoteResource public var image: URL
    }
    
    public struct Weapon: Decodable {
        public var id: String
        public var weapon: WeaponDetail?
        public var coopSpecialWeapon: CoopSpecialWeapon?
        
        public struct WeaponDetail: Decodable {
            public var id: String
            public var name: String
            @SN2RemoteResource public var thumbnail: URL
            @SN2RemoteResource public var image: URL
        }
        
        public struct CoopSpecialWeapon: Decodable {
            public var name: String
            @SN2RemoteResource public var image: URL
        }
    }
}
