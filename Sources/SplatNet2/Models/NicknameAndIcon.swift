public struct NicknameAndIcon: Decodable {
    
    public var nicknameAndIcons: [NicknameAndIcon]
    
    public struct NicknameAndIcon: Decodable {
        public var nsaId: String
        public var nickname: String
        @SN2WebResource public var thumbnailUrl: SN2URL
    }
}
