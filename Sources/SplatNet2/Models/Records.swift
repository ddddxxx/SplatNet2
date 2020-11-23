public struct Records: Codable {
    public var records: Records
}

extension Records {
    
    public struct Records: Codable {
        public var player: Player
    }
}
