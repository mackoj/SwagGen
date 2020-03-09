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

    /** Gets a list of StopPoints corresponding to the given list of stop ids. */
    public enum StopPointGet {

        public static let service = APIService<Response>(id: "StopPoint_Get", tag: "StopPoint", method: "GET", path: "/StopPoint/{ids}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of stop point ids (station naptan code e.g. 940GZZLUASL). Max. approx. 20 ids.
            You can use /StopPoint/Search/{query} endpoint to find a stop point id from a station name. */
                public var ids: [String]

                /** Include the crowding data (static). To Filter further use: /StopPoint/{ids}/Crowding/{line} */
                public var includeCrowdingData: Bool?

                public init(ids: [String], includeCrowdingData: Bool? = nil) {
                    self.ids = ids
                    self.includeCrowdingData = includeCrowdingData
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: StopPointGet.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(ids: [String], includeCrowdingData: Bool? = nil) {
                let options = Options(ids: ids, includeCrowdingData: includeCrowdingData)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "ids" + "}", with: "\(self.options.ids.joined(separator: ","))")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let includeCrowdingData = options.includeCrowdingData {
                  params["includeCrowdingData"] = includeCrowdingData
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [StopPoint]

            /** OK */
            case status200([StopPoint])

            public var success: [StopPoint]? {
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
                case 200: self = try .status200(decoder.decode([StopPoint].self, from: data))
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
