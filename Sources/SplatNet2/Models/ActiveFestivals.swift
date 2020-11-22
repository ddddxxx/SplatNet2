public struct ActiveFestivals: Decodable {
    public var festivals: [Festival]
}

public struct Festival: Decodable {
    
    public var images: FestivalImages
    public var names: FestivalNames
    public var colors: FestivalColors
    public var times: FestivalTimes
}

extension Festival {
    
    public struct FestivalImages: Decodable {
        @SN2RemoteResource public var alpha: URL
        @SN2RemoteResource public var panel: URL
        @SN2RemoteResource public var bravo: URL
    }
    
    public struct FestivalNames: Decodable {
        public var alphaLong: String
        public var bravoLong: String
        public var alphaShort: String
        public var bravoShort: String
    }
    
    public struct FestivalColors: Decodable {
        public var alpha: SN2Color
        public var bravo: SN2Color
    }
    
    public struct FestivalTimes: Decodable {
        @Timestamp public var result: Date
        @Timestamp public var announce: Date
        @Timestamp public var start: Date
        @Timestamp public var end: Date
    }
}
