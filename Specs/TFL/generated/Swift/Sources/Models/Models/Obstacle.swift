//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Obstacle: APIModel {

    public var incline: String?

    public var position: String?

    public var stopId: Int?

    public var type: String?

    public init(incline: String? = nil, position: String? = nil, stopId: Int? = nil, type: String? = nil) {
        self.incline = incline
        self.position = position
        self.stopId = stopId
        self.type = type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        incline = try container.decodeIfPresent("incline")
        position = try container.decodeIfPresent("position")
        stopId = try container.decodeIfPresent("stopId")
        type = try container.decodeIfPresent("type")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(incline, forKey: "incline")
        try container.encodeIfPresent(position, forKey: "position")
        try container.encodeIfPresent(stopId, forKey: "stopId")
        try container.encodeIfPresent(type, forKey: "type")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Obstacle else { return false }
      guard self.incline == object.incline else { return false }
      guard self.position == object.position else { return false }
      guard self.stopId == object.stopId else { return false }
      guard self.type == object.type else { return false }
      return true
    }

    public static func == (lhs: Obstacle, rhs: Obstacle) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}