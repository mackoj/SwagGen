//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class ApiVersionInfo: APIModel {

    public var assemblies: [String]?

    public var label: String?

    public var timestamp: DateTime?

    public var version: String?

    public init(assemblies: [String]? = nil, label: String? = nil, timestamp: DateTime? = nil, version: String? = nil) {
        self.assemblies = assemblies
        self.label = label
        self.timestamp = timestamp
        self.version = version
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        assemblies = try container.decodeArrayIfPresent("assemblies")
        label = try container.decodeIfPresent("label")
        timestamp = try container.decodeIfPresent("timestamp")
        version = try container.decodeIfPresent("version")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(assemblies, forKey: "assemblies")
        try container.encodeIfPresent(label, forKey: "label")
        try container.encodeIfPresent(timestamp, forKey: "timestamp")
        try container.encodeIfPresent(version, forKey: "version")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? ApiVersionInfo else { return false }
      guard self.assemblies == object.assemblies else { return false }
      guard self.label == object.label else { return false }
      guard self.timestamp == object.timestamp else { return false }
      guard self.version == object.version else { return false }
      return true
    }

    public static func == (lhs: ApiVersionInfo, rhs: ApiVersionInfo) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
