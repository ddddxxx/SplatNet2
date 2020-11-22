public struct TeamMember: Decodable {
    public var killCount: Int
    public var assistCount: Int
    public var deathCount: Int
    public var specialCount: Int
    public var gamePaintPoint: Int
    public var sortScore: Int
    public var player: Player
}
