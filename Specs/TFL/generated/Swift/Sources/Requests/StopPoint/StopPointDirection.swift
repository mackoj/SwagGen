//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
#if canImport(TFLModels)
import TFLModels
import TFLSharedCode
#endif

extension TFL.StopPoint {

    /** Returns the canonical direction, "inbound" or "outbound", for a given pair of stop point Ids in the direction from -> to. */
    public enum StopPointDirection {

        public static let service = APIService<Response>(id: "StopPoint_Direction", tag: "StopPoint", method: "GET", path: "/StopPoint/{id}/DirectionTo/{toStopPointId}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Originating stop id (station naptan code e.g. 940GZZLUASL, you can use /StopPoint/Search/{query} endpoint to find a stop point id from a station name) */
                public var id: String

                /** Destination stop id (station naptan code e.g. 940GZZLUASL, you can use /StopPoint/Search/{query} endpoint to find a stop point id from a station name) */
                public var toStopPointId: String

                /** Optional line id filter e.g. victoria */
                public var lineId: String?

                public init(id: String, toStopPointId: String, lineId: String? = nil) {
                    self.id = id
                    self.toStopPointId = toStopPointId
                    self.lineId = lineId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: StopPointDirection.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: String, toStopPointId: String, lineId: String? = nil) {
                let options = Options(id: id, toStopPointId: toStopPointId, lineId: lineId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)").replacingOccurrences(of: "{" + "toStopPointId" + "}", with: "\(self.options.toStopPointId)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let lineId = options.lineId {
                  params["lineId"] = lineId
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = String

            /** OK */
            case status200(String)

            public var success: String? {
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
                case 200: self = try .status200(decoder.decode(String.self, from: data))
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
