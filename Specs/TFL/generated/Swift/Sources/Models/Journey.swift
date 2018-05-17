//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** Object that represents an end to end journey (see schematic). */
public class Journey: Codable, Equatable {

    public var arrivalDateTime: Date?

    public var duration: Int?

    public var legs: [Leg]?

    public var startDateTime: Date?

    public init(arrivalDateTime: Date? = nil, duration: Int? = nil, legs: [Leg]? = nil, startDateTime: Date? = nil) {
        self.arrivalDateTime = arrivalDateTime
        self.duration = duration
        self.legs = legs
        self.startDateTime = startDateTime
    }

    private enum CodingKeys: String, CodingKey {
        case arrivalDateTime
        case duration
        case legs
        case startDateTime
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        arrivalDateTime = try container.decodeIfPresent(.arrivalDateTime)
        duration = try container.decodeIfPresent(.duration)
        legs = try container.decodeArrayIfPresent(.legs)
        startDateTime = try container.decodeIfPresent(.startDateTime)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(arrivalDateTime, forKey: .arrivalDateTime)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(legs, forKey: .legs)
        try container.encodeIfPresent(startDateTime, forKey: .startDateTime)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Journey else { return false }
      guard self.arrivalDateTime == object.arrivalDateTime else { return false }
      guard self.duration == object.duration else { return false }
      guard self.legs == object.legs else { return false }
      guard self.startDateTime == object.startDateTime else { return false }
      return true
    }

    public static func == (lhs: Journey, rhs: Journey) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
