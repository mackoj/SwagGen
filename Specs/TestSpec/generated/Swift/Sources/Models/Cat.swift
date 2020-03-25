//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Cat: Animal {

    public var meows: Bool?

    public init(animal: String? = nil, meows: Bool? = nil) {
        self.meows = meows
        super.init(animal: animal)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        meows = try container.decodeIfPresent("meows")
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(meows, forKey: "meows")
        try super.encode(to: encoder)
    }

    override public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Cat else { return false }
      guard self.meows == object.meows else { return false }
      return super.isEqual(to: object)
    }
}
