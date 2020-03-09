//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
#if canImport(TFLModels)
import TFLModels
import TFLSharedCode
#endif

extension TFL.Journey {

    /** Perform a Journey Planner search from the parameters specified in simple types */
    public enum JourneyJourneyResults {

        public static let service = APIService<Response>(id: "Journey_JourneyResults", tag: "Journey", method: "GET", path: "/Journey/JourneyResults/{from}/to/{to}", hasBody: false)

        /** Does the time given relate to arrival or leaving time? Possible options: "departing" | "arriving" */
        public enum TimeIs: String, Codable, Equatable, CaseIterable {
            case arriving = "Arriving"
            case departing = "Departing"
        }

        /** The journey preference eg possible options: "leastinterchange" | "leasttime" | "leastwalking" */
        public enum JourneyPreference: String, Codable, Equatable, CaseIterable {
            case leastInterchange = "LeastInterchange"
            case leastTime = "LeastTime"
            case leastWalking = "LeastWalking"
        }

        /** The accessibility preference must be a comma separated list eg. "noSolidStairs,noEscalators,noElevators,stepFreeToVehicle,stepFreeToPlatform" */
        public enum AccessibilityPreference: String, Codable, Equatable, CaseIterable {
            case noRequirements = "NoRequirements"
            case noSolidStairs = "NoSolidStairs"
            case noEscalators = "NoEscalators"
            case noElevators = "NoElevators"
            case stepFreeToVehicle = "StepFreeToVehicle"
            case stepFreeToPlatform = "StepFreeToPlatform"
        }

        /** The walking speed. eg possible options: "slow" | "average" | "fast". */
        public enum WalkingSpeed: String, Codable, Equatable, CaseIterable {
            case slow = "Slow"
            case average = "Average"
            case fast = "Fast"
        }

        /** The cycle preference. eg possible options: "allTheWay" | "leaveAtStation" | "takeOnTransport" | "cycleHire" */
        public enum CyclePreference: String, Codable, Equatable, CaseIterable {
            case none = "None"
            case leaveAtStation = "LeaveAtStation"
            case takeOnTransport = "TakeOnTransport"
            case allTheWay = "AllTheWay"
            case cycleHire = "CycleHire"
        }

        /** A comma separated list of cycling proficiency levels. eg possible options: "easy,moderate,fast" */
        public enum BikeProficiency: String, Codable, Equatable, CaseIterable {
            case easy = "Easy"
            case moderate = "Moderate"
            case fast = "Fast"
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Origin of the journey. Can be WGS84 coordinates expressed as "lat,long", a UK postcode, a Naptan (StopPoint) id, an ICS StopId, or a free-text string (will cause disambiguation unless it exactly matches a point of interest name). */
                public var from: String

                /** Destination of the journey. Can be WGS84 coordinates expressed as "lat,long", a UK postcode, a Naptan (StopPoint) id, an ICS StopId, or a free-text string (will cause disambiguation unless it exactly matches a point of interest name). */
                public var to: String

                /** Travel through point on the journey. Can be WGS84 coordinates expressed as "lat,long", a UK postcode, a Naptan (StopPoint) id, an ICS StopId, or a free-text string (will cause disambiguation unless it exactly matches a point of interest name). */
                public var via: String?

                /** Does the journey cover stops outside London? eg. "nationalSearch=true" */
                public var nationalSearch: Bool?

                /** The date must be in yyyyMMdd format */
                public var date: String?

                /** The time must be in HHmm format */
                public var time: String?

                /** Does the time given relate to arrival or leaving time? Possible options: "departing" | "arriving" */
                public var timeIs: TimeIs?

                /** The journey preference eg possible options: "leastinterchange" | "leasttime" | "leastwalking" */
                public var journeyPreference: JourneyPreference?

                /** The mode must be a comma separated list of modes. eg possible options: "public-bus,overground,train,tube,coach,dlr,cablecar,tram,river,walking,cycle" */
                public var mode: [String]?

                /** The accessibility preference must be a comma separated list eg. "noSolidStairs,noEscalators,noElevators,stepFreeToVehicle,stepFreeToPlatform" */
                public var accessibilityPreference: [AccessibilityPreference]?

                /** An optional name to associate with the origin of the journey in the results. */
                public var fromName: String?

                /** An optional name to associate with the destination of the journey in the results. */
                public var toName: String?

                /** An optional name to associate with the via point of the journey in the results. */
                public var viaName: String?

                /** The max walking time in minutes for transfer eg. "120" */
                public var maxTransferMinutes: String?

                /** The max walking time in minutes for journeys eg. "120" */
                public var maxWalkingMinutes: String?

                /** The walking speed. eg possible options: "slow" | "average" | "fast". */
                public var walkingSpeed: WalkingSpeed?

                /** The cycle preference. eg possible options: "allTheWay" | "leaveAtStation" | "takeOnTransport" | "cycleHire" */
                public var cyclePreference: CyclePreference?

                /** Time adjustment command. eg possible options: "TripFirst" | "TripLast" */
                public var adjustment: String?

                /** A comma separated list of cycling proficiency levels. eg possible options: "easy,moderate,fast" */
                public var bikeProficiency: [BikeProficiency]?

                /** Option to determine whether to return alternative cycling journey */
                public var alternativeCycle: Bool?

                /** Option to determine whether to return alternative walking journey */
                public var alternativeWalking: Bool?

                /** Flag to determine whether certain text (e.g. walking instructions) should be output with HTML tags or not. */
                public var applyHtmlMarkup: Bool?

                /** A boolean to indicate whether or not to return 3 public transport journeys, a bus journey, a cycle hire journey, a personal cycle journey and a walking journey */
                public var useMultiModalCall: Bool?

                /** A boolean to indicate whether to optimize journeys using walking */
                public var walkingOptimization: Bool?

                public init(from: String, to: String, via: String? = nil, nationalSearch: Bool? = nil, date: String? = nil, time: String? = nil, timeIs: TimeIs? = nil, journeyPreference: JourneyPreference? = nil, mode: [String]? = nil, accessibilityPreference: [AccessibilityPreference]? = nil, fromName: String? = nil, toName: String? = nil, viaName: String? = nil, maxTransferMinutes: String? = nil, maxWalkingMinutes: String? = nil, walkingSpeed: WalkingSpeed? = nil, cyclePreference: CyclePreference? = nil, adjustment: String? = nil, bikeProficiency: [BikeProficiency]? = nil, alternativeCycle: Bool? = nil, alternativeWalking: Bool? = nil, applyHtmlMarkup: Bool? = nil, useMultiModalCall: Bool? = nil, walkingOptimization: Bool? = nil) {
                    self.from = from
                    self.to = to
                    self.via = via
                    self.nationalSearch = nationalSearch
                    self.date = date
                    self.time = time
                    self.timeIs = timeIs
                    self.journeyPreference = journeyPreference
                    self.mode = mode
                    self.accessibilityPreference = accessibilityPreference
                    self.fromName = fromName
                    self.toName = toName
                    self.viaName = viaName
                    self.maxTransferMinutes = maxTransferMinutes
                    self.maxWalkingMinutes = maxWalkingMinutes
                    self.walkingSpeed = walkingSpeed
                    self.cyclePreference = cyclePreference
                    self.adjustment = adjustment
                    self.bikeProficiency = bikeProficiency
                    self.alternativeCycle = alternativeCycle
                    self.alternativeWalking = alternativeWalking
                    self.applyHtmlMarkup = applyHtmlMarkup
                    self.useMultiModalCall = useMultiModalCall
                    self.walkingOptimization = walkingOptimization
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: JourneyJourneyResults.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(from: String, to: String, via: String? = nil, nationalSearch: Bool? = nil, date: String? = nil, time: String? = nil, timeIs: TimeIs? = nil, journeyPreference: JourneyPreference? = nil, mode: [String]? = nil, accessibilityPreference: [AccessibilityPreference]? = nil, fromName: String? = nil, toName: String? = nil, viaName: String? = nil, maxTransferMinutes: String? = nil, maxWalkingMinutes: String? = nil, walkingSpeed: WalkingSpeed? = nil, cyclePreference: CyclePreference? = nil, adjustment: String? = nil, bikeProficiency: [BikeProficiency]? = nil, alternativeCycle: Bool? = nil, alternativeWalking: Bool? = nil, applyHtmlMarkup: Bool? = nil, useMultiModalCall: Bool? = nil, walkingOptimization: Bool? = nil) {
                let options = Options(from: from, to: to, via: via, nationalSearch: nationalSearch, date: date, time: time, timeIs: timeIs, journeyPreference: journeyPreference, mode: mode, accessibilityPreference: accessibilityPreference, fromName: fromName, toName: toName, viaName: viaName, maxTransferMinutes: maxTransferMinutes, maxWalkingMinutes: maxWalkingMinutes, walkingSpeed: walkingSpeed, cyclePreference: cyclePreference, adjustment: adjustment, bikeProficiency: bikeProficiency, alternativeCycle: alternativeCycle, alternativeWalking: alternativeWalking, applyHtmlMarkup: applyHtmlMarkup, useMultiModalCall: useMultiModalCall, walkingOptimization: walkingOptimization)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "from" + "}", with: "\(self.options.from)").replacingOccurrences(of: "{" + "to" + "}", with: "\(self.options.to)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let via = options.via {
                  params["via"] = via
                }
                if let nationalSearch = options.nationalSearch {
                  params["nationalSearch"] = nationalSearch
                }
                if let date = options.date {
                  params["date"] = date
                }
                if let time = options.time {
                  params["time"] = time
                }
                if let timeIs = options.timeIs?.encode() {
                  params["timeIs"] = timeIs
                }
                if let journeyPreference = options.journeyPreference?.encode() {
                  params["journeyPreference"] = journeyPreference
                }
                if let mode = options.mode?.joined(separator: ",") {
                  params["mode"] = mode
                }
                if let accessibilityPreference = options.accessibilityPreference?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["accessibilityPreference"] = accessibilityPreference
                }
                if let fromName = options.fromName {
                  params["fromName"] = fromName
                }
                if let toName = options.toName {
                  params["toName"] = toName
                }
                if let viaName = options.viaName {
                  params["viaName"] = viaName
                }
                if let maxTransferMinutes = options.maxTransferMinutes {
                  params["maxTransferMinutes"] = maxTransferMinutes
                }
                if let maxWalkingMinutes = options.maxWalkingMinutes {
                  params["maxWalkingMinutes"] = maxWalkingMinutes
                }
                if let walkingSpeed = options.walkingSpeed?.encode() {
                  params["walkingSpeed"] = walkingSpeed
                }
                if let cyclePreference = options.cyclePreference?.encode() {
                  params["cyclePreference"] = cyclePreference
                }
                if let adjustment = options.adjustment {
                  params["adjustment"] = adjustment
                }
                if let bikeProficiency = options.bikeProficiency?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["bikeProficiency"] = bikeProficiency
                }
                if let alternativeCycle = options.alternativeCycle {
                  params["alternativeCycle"] = alternativeCycle
                }
                if let alternativeWalking = options.alternativeWalking {
                  params["alternativeWalking"] = alternativeWalking
                }
                if let applyHtmlMarkup = options.applyHtmlMarkup {
                  params["applyHtmlMarkup"] = applyHtmlMarkup
                }
                if let useMultiModalCall = options.useMultiModalCall {
                  params["useMultiModalCall"] = useMultiModalCall
                }
                if let walkingOptimization = options.walkingOptimization {
                  params["walkingOptimization"] = walkingOptimization
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = ItineraryResult

            /** OK */
            case status200(ItineraryResult)

            public var success: ItineraryResult? {
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
                case 200: self = try .status200(decoder.decode(ItineraryResult.self, from: data))
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
