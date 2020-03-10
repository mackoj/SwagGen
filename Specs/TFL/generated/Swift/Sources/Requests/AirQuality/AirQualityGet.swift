//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
#if canImport(TFLModels)
import TFLModels
import TFLSharedCode
#endif

extension TFL.AirQuality {

    /** Gets air quality data feed */
    public enum AirQualityGet {

        public static let service = APIService<Response>(id: "AirQuality_Get", tag: "AirQuality", method: "GET", path: "/AirQuality", hasBody: false)

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: AirQualityGet.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Object

            /** OK */
            case status200(Object)

            public var success: Object? {
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
                case 200: self = try .status200(decoder.decode(Object.self, from: data))
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
