public struct Gear: Codable {
    public var id: String
    public var name: String
    public var kind: Kind
    public var rarity: Int
    public var brand: Brand
    @SN2WebResource public var image: SN2URL
    
    public enum Kind: String, Codable {
        case head
        case clothes
        case shoes
    }
    
    public struct Brand: Codable {
        public var id: String
        public var name: String
        @SN2WebResource public var image: SN2URL
        public var frequentSkill: FrequentSkill
        
        public struct FrequentSkill: Codable {
            public var id: String
            public var name: String
            @SN2WebResource public var image: SN2URL
        }
    }
}
