//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class DbGeographyWellKnownValue: APIModel {

    public var coordinateSystemId: Int?

    public var wellKnownBinary: File?

    public var wellKnownText: String?

    public init(coordinateSystemId: Int? = nil, wellKnownBinary: File? = nil, wellKnownText: String? = nil) {
        self.coordinateSystemId = coordinateSystemId
        self.wellKnownBinary = wellKnownBinary
        self.wellKnownText = wellKnownText
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        coordinateSystemId = try container.decodeIfPresent("coordinateSystemId")
        wellKnownBinary = try container.decodeIfPresent("wellKnownBinary")
        wellKnownText = try container.decodeIfPresent("wellKnownText")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(coordinateSystemId, forKey: "coordinateSystemId")
        try container.encodeIfPresent(wellKnownBinary, forKey: "wellKnownBinary")
        try container.encodeIfPresent(wellKnownText, forKey: "wellKnownText")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? DbGeographyWellKnownValue else { return false }
      guard self.coordinateSystemId == object.coordinateSystemId else { return false }
      guard self.wellKnownBinary == object.wellKnownBinary else { return false }
      guard self.wellKnownText == object.wellKnownText else { return false }
      return true
    }

    public static func == (lhs: DbGeographyWellKnownValue, rhs: DbGeographyWellKnownValue) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
