//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import PetstoreTestModels
import PetstoreTestSharedCode

extension PetstoreTest.Store {

    /**
    Delete purchase order by ID

    For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
    */
    public enum DeleteOrder {

        public static let service = APIService<Response>(id: "deleteOrder", tag: "store", method: "DELETE", path: "/store/order/{order_id}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** ID of the order that needs to be deleted */
                public var orderId: String

                public init(orderId: String) {
                    self.orderId = orderId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: DeleteOrder.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(orderId: String) {
                let options = Options(orderId: orderId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "order_id" + "}", with: "\(self.options.orderId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /** Invalid ID supplied */
            case status400

            /** Order not found */
            case status404

            public var success: Void? {
                switch self {
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status400: return 400
                case .status404: return 404
                }
            }

            public var successful: Bool {
                switch self {
                case .status400: return false
                case .status404: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 400: self = .status400
                case 404: self = .status404
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
