//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class DeviceRegistrationWindow: APIModel {

    /** The number of days a de/registration period runs for. */
    public var periodDays: Int

    /** The maximum de/registrations that can be made in a period. */
    public var limit: Int

    /** The remaining de/registrations that can be made in the current period. */
    public var remaining: Int

    /** The start date of the current period.
This is based on the earliest device de/registrations in the past N days, where
N is defined by `periodDays`.
If no device has been de/registered then start date will be from the current date.
 */
    public var startDate: DateTime

    /** The end date of the current period.
This is based on the value of `startDate` plus the number of days defined by  `periodDays`.
 */
    public var endDate: DateTime

    public init(periodDays: Int, limit: Int, remaining: Int, startDate: DateTime, endDate: DateTime) {
        self.periodDays = periodDays
        self.limit = limit
        self.remaining = remaining
        self.startDate = startDate
        self.endDate = endDate
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        periodDays = try container.decode("periodDays")
        limit = try container.decode("limit")
        remaining = try container.decode("remaining")
        startDate = try container.decode("startDate")
        endDate = try container.decode("endDate")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(periodDays, forKey: "periodDays")
        try container.encode(limit, forKey: "limit")
        try container.encode(remaining, forKey: "remaining")
        try container.encode(startDate, forKey: "startDate")
        try container.encode(endDate, forKey: "endDate")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? DeviceRegistrationWindow else { return false }
      guard self.periodDays == object.periodDays else { return false }
      guard self.limit == object.limit else { return false }
      guard self.remaining == object.remaining else { return false }
      guard self.startDate == object.startDate else { return false }
      guard self.endDate == object.endDate else { return false }
      return true
    }

    public static func == (lhs: DeviceRegistrationWindow, rhs: DeviceRegistrationWindow) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
