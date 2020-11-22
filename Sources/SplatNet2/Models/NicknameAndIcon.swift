public struct NicknameAndIcon: Decodable {
    
    public var nicknameAndIcons: [NicknameAndIcon]
    
    public struct NicknameAndIcon: Decodable {
        public var nsaId: String
        public var nickname: String
        @SN2RemoteResource public var thumbnailUrl: URL
    }
}
