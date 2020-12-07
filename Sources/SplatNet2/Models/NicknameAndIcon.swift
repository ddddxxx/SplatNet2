public struct NicknameAndIcon: Codable {
    
    public var nicknameAndIcons: [NicknameAndIcon]
    
    public struct NicknameAndIcon: Codable {
        public var nsaId: String
        public var nickname: String
        public var thumbnailUrl: SN2URL
    }
}
