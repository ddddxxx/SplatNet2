public struct Stage: Decodable {
    public var id: String
    public var name: String
    @SN2RemoteResource public var image: URL
}
