//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class LineServiceTypeInfo: APIModel {

    public var name: String?

    public var uri: String?

    public init(name: String? = nil, uri: String? = nil) {
        self.name = name
        self.uri = uri
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        name = try container.decodeIfPresent("name")
        uri = try container.decodeIfPresent("uri")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(name, forKey: "name")
        try container.encodeIfPresent(uri, forKey: "uri")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? LineServiceTypeInfo else { return false }
      guard self.name == object.name else { return false }
      guard self.uri == object.uri else { return false }
      return true
    }

    public static func == (lhs: LineServiceTypeInfo, rhs: LineServiceTypeInfo) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
