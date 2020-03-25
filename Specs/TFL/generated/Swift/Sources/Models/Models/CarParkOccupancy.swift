//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class CarParkOccupancy: APIModel {

    public var bays: [Bay]?

    public var carParkDetailsUrl: String?

    public var id: String?

    public var name: String?

    public init(bays: [Bay]? = nil, carParkDetailsUrl: String? = nil, id: String? = nil, name: String? = nil) {
        self.bays = bays
        self.carParkDetailsUrl = carParkDetailsUrl
        self.id = id
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        bays = try container.decodeArrayIfPresent("bays")
        carParkDetailsUrl = try container.decodeIfPresent("carParkDetailsUrl")
        id = try container.decodeIfPresent("id")
        name = try container.decodeIfPresent("name")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(bays, forKey: "bays")
        try container.encodeIfPresent(carParkDetailsUrl, forKey: "carParkDetailsUrl")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(name, forKey: "name")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? CarParkOccupancy else { return false }
      guard self.bays == object.bays else { return false }
      guard self.carParkDetailsUrl == object.carParkDetailsUrl else { return false }
      guard self.id == object.id else { return false }
      guard self.name == object.name else { return false }
      return true
    }

    public static func == (lhs: CarParkOccupancy, rhs: CarParkOccupancy) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}