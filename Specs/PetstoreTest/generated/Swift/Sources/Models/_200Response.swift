//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** Model for testing model name starting with number */
public class _200Response: APIModel {

    public var `class`: String?

    public var name: Int?

    public init(`class`: String? = nil, name: Int? = nil) {
        self.`class` = `class`
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        `class` = try container.decodeIfPresent("class")
        name = try container.decodeIfPresent("name")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(`class`, forKey: "class")
        try container.encodeIfPresent(name, forKey: "name")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? _200Response else { return false }
      guard self.`class` == object.`class` else { return false }
      guard self.name == object.name else { return false }
      return true
    }

    public static func == (lhs: _200Response, rhs: _200Response) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
