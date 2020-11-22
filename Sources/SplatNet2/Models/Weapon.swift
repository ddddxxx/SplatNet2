public struct Weapon: Decodable {
    public var id: String
    public var name: String
    @SN2RemoteResource public var image: URL
    @SN2RemoteResource public var thumbnail: URL
    public var sub: Equipment
    public var special: Equipment
    
    public struct Equipment: Decodable {
        public var id: String
        public var name: String
        @SN2RemoteResource public var imageA: URL
        @SN2RemoteResource public var imageB: URL
    }
}
