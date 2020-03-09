//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import RocketModels
import RocketSharedCode

extension Rocket.Profile {

    /** Record the watched playhead position of a video under the active profile.
Can be used later to resume a video from where it was last watched.
Creates one if it doesn't exist, overwrites one if it does.
 */
    public enum SetItemWatchedStatus {

        public static let service = APIService<Response>(id: "setItemWatchedStatus", tag: "profile", method: "PUT", path: "/account/profile/watched/{itemId}", hasBody: false, securityRequirement: SecurityRequirement(type: "profileAuth", scopes: ["Catalog"]))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The id of the item being watched. */
                public var itemId: String

                /** The playhead position to record. */
                public var position: Int

                public init(itemId: String, position: Int) {
                    self.itemId = itemId
                    self.position = position
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: SetItemWatchedStatus.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(itemId: String, position: Int) {
                let options = Options(itemId: itemId, position: position)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "itemId" + "}", with: "\(self.options.itemId)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["position"] = options.position
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Watched

            /** OK. */
            case status200(Watched)

            /** Bad request. */
            case status400(ServiceError)

            /** Invalid access token. */
            case status401(ServiceError)

            /** Forbidden. */
            case status403(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: Watched? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status401(let response): return response
                case .status403(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<Watched, ServiceError> {
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
                case .status401(let response): return response
                case .status403(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status401: return 401
                case .status403: return 403
                case .status404: return 404
                case .status500: return 500
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status401: return false
                case .status403: return false
                case .status404: return false
                case .status500: return false
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Watched.self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceError.self, from: data))
                case 401: self = try .status401(decoder.decode(ServiceError.self, from: data))
                case 403: self = try .status403(decoder.decode(ServiceError.self, from: data))
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
