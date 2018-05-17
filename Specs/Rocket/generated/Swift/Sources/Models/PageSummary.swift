//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class PageSummary: Codable, Equatable {

    /** Unique identifier for the page. */
    public var id: String

    /** Unique path for the page. */
    public var path: String

    /** Title of the page. */
    public var title: String

    /** Identifier for of the page template to render this page. */
    public var template: String

    /** True if this page is static and doesn't have any dynamic content to load.

Static pages don't need to go back to the page endpoint to load page content
instead the page summary loaded with the sitemap should be enough to determine
the page template type and render based on this.
 */
    public var isStatic: Bool

    /** True if this page is a system page type.

**DEPRECATED** This property doesn't have any real use in client applications
anymore so shouldn't be used. It especially shouldn't be used to determine if
a page is static or not. Use the `isStatic` property instead.
 */
    public var isSystemPage: Bool

    /** Key used to lookup a known page. */
    public var key: String?

    public init(id: String, path: String, title: String, template: String, isStatic: Bool, isSystemPage: Bool, key: String? = nil) {
        self.id = id
        self.path = path
        self.title = title
        self.template = template
        self.isStatic = isStatic
        self.isSystemPage = isSystemPage
        self.key = key
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case path
        case title
        case template
        case isStatic
        case isSystemPage
        case key
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(.id)
        path = try container.decode(.path)
        title = try container.decode(.title)
        template = try container.decode(.template)
        isStatic = try container.decode(.isStatic)
        isSystemPage = try container.decode(.isSystemPage)
        key = try container.decodeIfPresent(.key)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(path, forKey: .path)
        try container.encode(title, forKey: .title)
        try container.encode(template, forKey: .template)
        try container.encode(isStatic, forKey: .isStatic)
        try container.encode(isSystemPage, forKey: .isSystemPage)
        try container.encodeIfPresent(key, forKey: .key)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? PageSummary else { return false }
      guard self.id == object.id else { return false }
      guard self.path == object.path else { return false }
      guard self.title == object.title else { return false }
      guard self.template == object.template else { return false }
      guard self.isStatic == object.isStatic else { return false }
      guard self.isSystemPage == object.isSystemPage else { return false }
      guard self.key == object.key else { return false }
      return true
    }

    public static func == (lhs: PageSummary, rhs: PageSummary) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
