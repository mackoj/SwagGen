//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import TFLModels
import TFLSharedCode

extension TFL.Place {

    /** Gets all places of a given type */
    public enum PlaceGetByType {

        public static let service = APIService<Response>(id: "Place_GetByType", tag: "Place", method: "GET", path: "/Place/Type/{types}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of the types to return. Max. approx 12 types.
            A valid list of place types can be obtained from the /Place/Meta/placeTypes endpoint. */
                public var types: [String]

                /** An optional parameter to limit the results to active records only (Currently only the 'VariableMessageSign' place type is supported) */
                public var activeOnly: Bool?

                public init(types: [String], activeOnly: Bool? = nil) {
                    self.types = types
                    self.activeOnly = activeOnly
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: PlaceGetByType.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(types: [String], activeOnly: Bool? = nil) {
                let options = Options(types: types, activeOnly: activeOnly)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "types" + "}", with: "\(self.options.types.joined(separator: ","))")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let activeOnly = options.activeOnly {
                  params["activeOnly"] = activeOnly
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Place]

            /** OK */
            case status200([Place])

            public var success: [Place]? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode([Place].self, from: data))
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
