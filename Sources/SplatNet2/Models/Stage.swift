public struct Stage: Decodable {
    public var id: String
    public var name: String
    @SN2WebResource public var image: SN2URL
}
