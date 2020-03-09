//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import TFLModels
import TFLSharedCode

extension TFL.Line {

    /** Get disruptions for the given line ids */
    public enum LineDisruption {

        public static let service = APIService<Response>(id: "Line_Disruption", tag: "Line", method: "GET", path: "/Line/{ids}/Disruption", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of line ids e.g. victoria,circle,N133. Max. approx. 20 ids. */
                public var ids: [String]

                public init(ids: [String]) {
                    self.ids = ids
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: LineDisruption.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(ids: [String]) {
                let options = Options(ids: ids)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "ids" + "}", with: "\(self.options.ids.joined(separator: ","))")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Disruption]

            /** OK */
            case status200([Disruption])

            public var success: [Disruption]? {
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
                case 200: self = try .status200(decoder.decode([Disruption].self, from: data))
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
