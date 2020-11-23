// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum AccessRole: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case admin
  case `operator`
  case commuter
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ADMIN": self = .admin
      case "OPERATOR": self = .operator
      case "COMMUTER": self = .commuter
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .admin: return "ADMIN"
      case .operator: return "OPERATOR"
      case .commuter: return "COMMUTER"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: AccessRole, rhs: AccessRole) -> Bool {
    switch (lhs, rhs) {
      case (.admin, .admin): return true
      case (.operator, .operator): return true
      case (.commuter, .commuter): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [AccessRole] {
    return [
      .admin,
      .operator,
      .commuter,
    ]
  }
}

public final class BaseLoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation baseLogin($email: String!, $password: String!) {
      baseLogin(email: $email, password: $password) {
        __typename
        token
        user {
          __typename
          id
          firstName
          lastName
          complete
          role {
            __typename
            role
            id
          }
        }
      }
    }
    """

  public let operationName: String = "baseLogin"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("baseLogin", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(BaseLogin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(baseLogin: BaseLogin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "baseLogin": baseLogin.flatMap { (value: BaseLogin) -> ResultMap in value.resultMap }])
    }

    public var baseLogin: BaseLogin? {
      get {
        return (resultMap["baseLogin"] as? ResultMap).flatMap { BaseLogin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "baseLogin")
      }
    }

    public struct BaseLogin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthData", "token": token, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("complete", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("role", type: .nonNull(.object(Role.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, complete: Bool, role: Role) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "complete": complete, "role": role.resultMap])
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

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var complete: Bool {
          get {
            return resultMap["complete"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "complete")
          }
        }

        public var role: Role {
          get {
            return Role(unsafeResultMap: resultMap["role"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "role")
          }
        }

        public struct Role: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Role"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("role", type: .scalar(AccessRole.self)),
              GraphQLField("id", type: .nonNull(.list(.nonNull(.scalar(GraphQLID.self))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(role: AccessRole? = nil, id: [GraphQLID]) {
            self.init(unsafeResultMap: ["__typename": "Role", "role": role, "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var role: AccessRole? {
            get {
              return resultMap["role"] as? AccessRole
            }
            set {
              resultMap.updateValue(newValue, forKey: "role")
            }
          }

          public var id: [GraphQLID] {
            get {
              return resultMap["id"]! as! [GraphQLID]
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

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
