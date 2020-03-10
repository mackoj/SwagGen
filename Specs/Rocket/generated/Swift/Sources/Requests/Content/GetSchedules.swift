//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

import RocketModels
import RocketSharedCode

extension Rocket.Content {

    /** Returns schedules for a defined set of channels over a requested period.
Schedules are requested in hour blocks and returned grouped by the channel
they belong to.
For example, to load 12 hours of schedules for channels `4343` and `5234`,
on 21/2/2017 starting from 08:00.
```
channels=4343,5234
date=2017-02-21
hour=8
x=12
```
If a channel id is passed which doesn't exist then this endpoint will
return an empty schedule list for it. If instead we returned 404,
this would invalidate all other channel schedules in the same request
which would be unfriendly for clients presenting these channel schedules.
 */
    public enum GetSchedules {

        public static let service = APIService<Response>(id: "getSchedules", tag: "content", method: "GET", path: "/schedules", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The list of channel ids to get schedules for. */
                public var channels: [String]

                /** The date to target in ISO format, e.g. `2017-05-23`.
The base hour requested will belong to this date.
 */
                public var date: DateDay

                /** The base hour in the day, defined by the `date` parameter, you wish to load schedules for.
From 0 to 23, where 0 is midnight.
 */
                public var hour: Int

                /** The number of hours of schedules to load from the base `hour` parameter.
This may be negative or positive depending on whether you want to load past or future schedules.
A value of zero is invalid.
 */
                public var duration: Int

                /** The type of device the content is targeting. */
                public var device: String?

                /** The active subscription code. */
                public var sub: String?

                /** The list of segments to filter the response by. */
                public var segments: [String]?

                /** The set of opt in feature flags which cause breaking changes to responses.
While Rocket APIs look to avoid breaking changes under the active major version, the formats of responses
may need to evolve over this time.
These feature flags allow clients to select which response formats they expect and avoid breaking
clients as these formats evolve under the current major version.
### Flags
- `all` - Enable all flags. Useful for testing. _Don't use in production_.
- `idp` - Dynamic item detail pages with schedulable rows.
- `ldp` - Dynamic list detail pages with schedulable rows.
See the `feature-flags.md` for available flag details.
 */
                public var ff: [FeatureFlags]?

                public init(channels: [String], date: DateDay, hour: Int, duration: Int, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                    self.channels = channels
                    self.date = date
                    self.hour = hour
                    self.duration = duration
                    self.device = device
                    self.sub = sub
                    self.segments = segments
                    self.ff = ff
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetSchedules.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(channels: [String], date: DateDay, hour: Int, duration: Int, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                let options = Options(channels: channels, date: date, hour: hour, duration: duration, device: device, sub: sub, segments: segments, ff: ff)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["channels"] = options.channels.joined(separator: ",")
                params["date"] = options.date.encode()
                params["hour"] = options.hour
                params["duration"] = options.duration
                if let device = options.device {
                  params["device"] = device
                }
                if let sub = options.sub {
                  params["sub"] = sub
                }
                if let segments = options.segments?.joined(separator: ",") {
                  params["segments"] = segments
                }
                if let ff = options.ff?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["ff"] = ff
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [ItemScheduleList]

            /** An array of schedule lists for each channel requested.
The order of the channels will match the order of channel ids passed during the request.
 */
            case status200([ItemScheduleList])

            /** Bad request. */
            case status400(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: [ItemScheduleList]? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<[ItemScheduleList], ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status404: return 404
                case .status500: return 500
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status404: return false
                case .status500: return false
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode([ItemScheduleList].self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceError.self, from: data))
                case 404: self = try .status404(decoder.decode(ServiceError.self, from: data))
                case 500: self = try .status500(decoder.decode(ServiceError.self, from: data))
                default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(ServiceError.self, from: data))
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
