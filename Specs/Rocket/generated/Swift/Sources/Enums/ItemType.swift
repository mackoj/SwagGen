//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

/** The item type to filter by. Defaults to unspecified. */
public enum ItemType: String, Codable, Equatable, CaseIterable {
    case movie = "movie"
    case show = "show"
    case season = "season"
    case episode = "episode"
    case program = "program"
    case link = "link"
    case trailer = "trailer"
    case channel = "channel"
}
