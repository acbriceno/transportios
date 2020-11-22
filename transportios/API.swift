// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class StopsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query stops {
      stops {
        __typename
        status
        code
        ... on StopsResponse {
          stops {
            __typename
            id
            name
            lat
            lon
          }
        }
      }
    }
    """

  public let operationName: String = "stops"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("stops", type: .nonNull(.object(Stop.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stops: Stop) {
      self.init(unsafeResultMap: ["__typename": "Query", "stops": stops.resultMap])
    }

    public var stops: Stop {
      get {
        return Stop(unsafeResultMap: resultMap["stops"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "stops")
      }
    }

    public struct Stop: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StopResponse", "StopsResponse", "OperatorRouteResponse", "OperatorRoutesResponse", "OperatorResponse", "PassResponse", "CommuterResponse", "BareOperatorResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["StopsResponse": AsStopsResponse.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("code", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeStopResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "StopResponse", "status": status, "code": code])
      }

      public static func makeOperatorRouteResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "OperatorRouteResponse", "status": status, "code": code])
      }

      public static func makeOperatorRoutesResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "OperatorRoutesResponse", "status": status, "code": code])
      }

      public static func makeOperatorResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "OperatorResponse", "status": status, "code": code])
      }

      public static func makePassResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "PassResponse", "status": status, "code": code])
      }

      public static func makeCommuterResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "CommuterResponse", "status": status, "code": code])
      }

      public static func makeBareOperatorResponse(status: Bool, code: String) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "BareOperatorResponse", "status": status, "code": code])
      }

      public static func makeStopsResponse(status: Bool, code: String, stops: [AsStopsResponse.Stop]? = nil) -> Stop {
        return Stop(unsafeResultMap: ["__typename": "StopsResponse", "status": status, "code": code, "stops": stops.flatMap { (value: [AsStopsResponse.Stop]) -> [ResultMap] in value.map { (value: AsStopsResponse.Stop) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: Bool {
        get {
          return resultMap["status"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var code: String {
        get {
          return resultMap["code"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "code")
        }
      }

      public var asStopsResponse: AsStopsResponse? {
        get {
          if !AsStopsResponse.possibleTypes.contains(__typename) { return nil }
          return AsStopsResponse(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsStopsResponse: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StopsResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
            GraphQLField("stops", type: .list(.nonNull(.object(Stop.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: Bool, code: String, stops: [Stop]? = nil) {
          self.init(unsafeResultMap: ["__typename": "StopsResponse", "status": status, "code": code, "stops": stops.flatMap { (value: [Stop]) -> [ResultMap] in value.map { (value: Stop) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var status: Bool {
          get {
            return resultMap["status"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public var code: String {
          get {
            return resultMap["code"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        public var stops: [Stop]? {
          get {
            return (resultMap["stops"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Stop] in value.map { (value: ResultMap) -> Stop in Stop(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Stop]) -> [ResultMap] in value.map { (value: Stop) -> ResultMap in value.resultMap } }, forKey: "stops")
          }
        }

        public struct Stop: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Stop"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
              GraphQLField("lon", type: .nonNull(.scalar(Double.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, lat: Double, lon: Double) {
            self.init(unsafeResultMap: ["__typename": "Stop", "id": id, "name": name, "lat": lat, "lon": lon])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var lat: Double {
            get {
              return resultMap["lat"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "lat")
            }
          }

          public var lon: Double {
            get {
              return resultMap["lon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "lon")
            }
          }
        }
      }
    }
  }
}
