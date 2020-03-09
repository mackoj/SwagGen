//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import PetstoreTestModels
import PetstoreTestSharedCode

extension PetstoreTest.Pet {

    /**
    Find pet by ID

    Returns a single pet
    */
    public enum GetPetById {

        public static let service = APIService<Response>(id: "getPetById", tag: "pet", method: "GET", path: "/pet/{petId}", hasBody: false, securityRequirement: SecurityRequirement(type: "api_key", scopes: []))

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** ID of pet to return */
                public var petId: Int

                public init(petId: Int) {
                    self.petId = petId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetPetById.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(petId: Int) {
                let options = Options(petId: petId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "petId" + "}", with: "\(self.options.petId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Pet

            /** successful operation */
            case status200(Pet)

            /** Invalid ID supplied */
            case status400

            /** Pet not found */
            case status404

            public var success: Pet? {
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
                case .status404: return 404
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status404: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Pet.self, from: data))
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
