public struct ActiveFestivals: Codable {
    public var festivals: [Festival]
}

public struct Festival: Codable {
    
    public var images: FestivalImages
    public var names: FestivalNames
    public var colors: FestivalColors
    public var times: FestivalTimes
}

extension Festival {
    
    public struct FestivalImages: Codable {
        @SN2WebResource public var alpha: SN2URL
        @SN2WebResource public var panel: SN2URL
        @SN2WebResource public var bravo: SN2URL
    }
    
    public struct FestivalNames: Codable {
        public var alphaLong: String
        public var bravoLong: String
        public var alphaShort: String
        public var bravoShort: String
    }
    
    public struct FestivalColors: Codable {
        public var alpha: SN2Color
        public var bravo: SN2Color
    }
    
    public struct FestivalTimes: Codable {
        @Timestamp public var result: SN2Date
        @Timestamp public var announce: SN2Date
        @Timestamp public var start: SN2Date
        @Timestamp public var end: SN2Date
    }
}
