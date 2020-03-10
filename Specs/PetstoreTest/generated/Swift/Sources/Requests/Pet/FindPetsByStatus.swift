//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

import PetstoreTestModels
import PetstoreTestSharedCode

extension PetstoreTest.Pet {

    /**
    Finds Pets by status

    Multiple status values can be provided with comma separated strings
    */
    public enum FindPetsByStatus {

        public static let service = APIService<Response>(id: "findPetsByStatus", tag: "pet", method: "GET", path: "/pet/findByStatus", hasBody: false, securityRequirement: SecurityRequirement(type: "petstore_auth", scopes: ["write:pets", "read:pets"]))

        /** Status values that need to be considered for filter */
        public enum Status: String, Codable, Equatable, CaseIterable {
            case available = "available"
            case pending = "pending"
            case sold = "sold"
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Status values that need to be considered for filter */
                public var status: [Status]

                public init(status: [Status]) {
                    self.status = status
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: FindPetsByStatus.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(status: [Status]) {
                let options = Options(status: status)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["status"] = options.status.encode().map({ String(describing: $0) }).joined(separator: ",")
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Pet]

            /** successful operation */
            case status200([Pet])

            /** Invalid status value */
            case status400

            public var success: [Pet]? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode([Pet].self, from: data))
                case 400: self = .status400
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
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
