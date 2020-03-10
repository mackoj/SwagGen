//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
#if canImport(TBXModels)
import TBXModels
import TBXSharedCode
#endif

extension TBX.Auth {

    /** Return Url from SAML login */
    public enum AuthSamlAssertPostAuthSamlAssert {

        public static let service = APIService<Response>(id: "auth.samlAssert__post_auth_saml_assert", tag: "auth", method: "POST", path: "/auth/saml/assert", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var relayState: String?

                public var sAMLResponse: String?

                public init(relayState: String? = nil, sAMLResponse: String? = nil) {
                    self.relayState = relayState
                    self.sAMLResponse = sAMLResponse
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: AuthSamlAssertPostAuthSamlAssert.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(relayState: String? = nil, sAMLResponse: String? = nil) {
                let options = Options(relayState: relayState, sAMLResponse: sAMLResponse)
                self.init(options: options)
            }

            public override var formParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let relayState = options.relayState {
                  params["RelayState"] = relayState
                }
                if let sAMLResponse = options.sAMLResponse {
                  params["SAMLResponse"] = sAMLResponse
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [String: Any]

            /** Request was successful */
            case status200([String: Any])

            public var success: [String: Any]? {
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
                case 200: self = try .status200(decoder.decodeAny([String: Any].self, from: data))
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
