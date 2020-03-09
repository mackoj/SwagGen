//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import TestSpecModels
import TestSpecSharedCode

extension TestSpec {

    /** operation with no responses */
    public enum GetDefaultResponse {

        public static let service = APIService<Response>(id: "getDefaultResponse", tag: "", method: "GET", path: "/default-response", hasBody: false, securityRequirement: SecurityRequirement(type: "test_auth", scopes: ["read"]))

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetDefaultResponse.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** unexpected error */
            case defaultResponse(statusCode: Int, ErrorType)

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var failure: ErrorType? {
                switch self {
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<Void, ErrorType> {
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
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(ErrorType.self, from: data))
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
