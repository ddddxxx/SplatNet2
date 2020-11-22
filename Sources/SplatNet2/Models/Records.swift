public struct Records: Decodable {
    public var records: Records
}

extension Records {
    
    public struct Records: Decodable {
        public var player: Player
    }
}
