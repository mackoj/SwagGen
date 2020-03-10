//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

import RocketModels
import RocketSharedCode

extension Rocket.Content {

    /** Returns the List of child summary items under an item.
If the item is a Season then the children will be episodes and ordered by episode number.
If the item is a Show then the children will be Seasons and ordered by season number.
Returns 404 if no children found.
 */
    public enum GetItemChildrenList {

        public static let service = APIService<Response>(id: "getItemChildrenList", tag: "content", method: "GET", path: "/items/{id}/children", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The identifier of the item whose children to load. */
                public var id: String

                /** The page of items to load. Starts from page 1. */
                public var page: Int?

                /** The number of items to return in a page. */
                public var pageSize: Int?

                /** The maximum rating (inclusive) of items returned, e.g. 'auoflc-pg'. */
                public var maxRating: String?

                /** The list sort order, either 'asc' or 'desc'. */
                public var order: ListOrder?

                /** The type of device the content is targeting. */
                public var device: String?

                /** The active subscription code. */
                public var sub: String?

                /** The list of segments to filter the response by. */
                public var segments: [String]?

                /** The set of opt in feature flags which cause breaking changes to responses.
While Rocket APIs look to avoid breaking changes under the active major version, the formats of responses
may need to evolve over this time.
These feature flags allow clients to select which response formats they expect and avoid breaking
clients as these formats evolve under the current major version.
### Flags
- `all` - Enable all flags. Useful for testing. _Don't use in production_.
- `idp` - Dynamic item detail pages with schedulable rows.
- `ldp` - Dynamic list detail pages with schedulable rows.
See the `feature-flags.md` for available flag details.
 */
                public var ff: [FeatureFlags]?

                public init(id: String, page: Int? = nil, pageSize: Int? = nil, maxRating: String? = nil, order: ListOrder? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                    self.id = id
                    self.page = page
                    self.pageSize = pageSize
                    self.maxRating = maxRating
                    self.order = order
                    self.device = device
                    self.sub = sub
                    self.segments = segments
                    self.ff = ff
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetItemChildrenList.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: String, page: Int? = nil, pageSize: Int? = nil, maxRating: String? = nil, order: ListOrder? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                let options = Options(id: id, page: page, pageSize: pageSize, maxRating: maxRating, order: order, device: device, sub: sub, segments: segments, ff: ff)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let page = options.page {
                  params["page"] = page
                }
                if let pageSize = options.pageSize {
                  params["page_size"] = pageSize
                }
                if let maxRating = options.maxRating {
                  params["max_rating"] = maxRating
                }
                if let order = options.order?.encode() {
                  params["order"] = order
                }
                if let device = options.device {
                  params["device"] = device
                }
                if let sub = options.sub {
                  params["sub"] = sub
                }
                if let segments = options.segments?.joined(separator: ",") {
                  params["segments"] = segments
                }
                if let ff = options.ff?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["ff"] = ff
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = ItemList

            /** The list of items requested. */
            case status200(ItemList)

            /** Bad request. */
            case status400(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: ItemList? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<ItemList, ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status404: return 404
                case .status500: return 500
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status404: return false
                case .status500: return false
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(ItemList.self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceError.self, from: data))
                case 404: self = try .status404(decoder.decode(ServiceError.self, from: data))
                case 500: self = try .status500(decoder.decode(ServiceError.self, from: data))
                default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(ServiceError.self, from: data))
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
