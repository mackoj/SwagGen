//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import TBXModels
import TBXSharedCode

extension TBX.DeviceService {

    public enum DeviceServiceCreateTryAndBuy {

        public static let service = APIService<Response>(id: "DeviceService.createTryAndBuy", tag: "DeviceService", method: "POST", path: "/DeviceServices/createTryAndBuy", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var apiKey: String

                public var deviceToken: String

                public var deviceType: String

                public var days: String

                public init(apiKey: String, deviceToken: String, deviceType: String, days: String) {
                    self.apiKey = apiKey
                    self.deviceToken = deviceToken
                    self.deviceType = deviceType
                    self.days = days
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: DeviceServiceCreateTryAndBuy.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(apiKey: String, deviceToken: String, deviceType: String, days: String) {
                let options = Options(apiKey: apiKey, deviceToken: deviceToken, deviceType: deviceType, days: days)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["api_key"] = options.apiKey
                params["deviceToken"] = options.deviceToken
                params["deviceType"] = options.deviceType
                params["days"] = options.days
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
