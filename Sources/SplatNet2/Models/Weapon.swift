public struct Weapon: Codable {
    public var id: String
    public var name: String
    @SN2WebResource public var image: SN2URL
    @SN2WebResource public var thumbnail: SN2URL
    public var sub: Equipment
    public var special: Equipment
    
    public struct Equipment: Codable {
        public var id: String
        public var name: String
        @SN2WebResource public var imageA: SN2URL
        @SN2WebResource public var imageB: SN2URL
    }
}
