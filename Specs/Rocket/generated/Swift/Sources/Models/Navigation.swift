//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Navigation: Codable, Equatable {

    /** The header navigation. */
    public var header: [NavEntry]

    /** The account navigation. */
    public var account: NavEntry?

    /** Copyright information. */
    public var copyright: String?

    /** A map of custom fields defined by a curator for navigation. */
    public var customFields: [String: Any]?

    /** The footer navigation. */
    public var footer: NavEntry?

    public init(header: [NavEntry], account: NavEntry? = nil, copyright: String? = nil, customFields: [String: Any]? = nil, footer: NavEntry? = nil) {
        self.header = header
        self.account = account
        self.copyright = copyright
        self.customFields = customFields
        self.footer = footer
    }

    private enum CodingKeys: String, CodingKey {
        case header
        case account
        case copyright
        case customFields
        case footer
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        header = try container.decodeArray(.header)
        account = try container.decodeIfPresent(.account)
        copyright = try container.decodeIfPresent(.copyright)
        customFields = try container.decodeAnyIfPresent(.customFields)
        footer = try container.decodeIfPresent(.footer)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(header, forKey: .header)
        try container.encodeIfPresent(account, forKey: .account)
        try container.encodeIfPresent(copyright, forKey: .copyright)
        try container.encodeAnyIfPresent(customFields, forKey: .customFields)
        try container.encodeIfPresent(footer, forKey: .footer)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Navigation else { return false }
      guard self.header == object.header else { return false }
      guard self.account == object.account else { return false }
      guard self.copyright == object.copyright else { return false }
      guard NSDictionary(dictionary: self.customFields ?? [:]).isEqual(to: object.customFields ?? [:]) else { return false }
      guard self.footer == object.footer else { return false }
      return true
    }

    public static func == (lhs: Navigation, rhs: Navigation) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
