//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

import TFLModels
import TFLSharedCode

extension TFL.Occupancy {

    /** Gets the occupancy for all car parks that have occupancy data */
    public enum GetOccupants {

        public static let service = APIService<Response>(id: "getOccupants", tag: "Occupancy", method: "GET", path: "/Occupancy/CarPark", hasBody: false)

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetOccupants.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [CarParkOccupancy]

            /** OK */
            case status200([CarParkOccupancy])

            public var success: [CarParkOccupancy]? {
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
                case 200: self = try .status200(decoder.decode([CarParkOccupancy].self, from: data))
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
