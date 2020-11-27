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

public enum StopType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case terminal
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "TERMINAL": self = .terminal
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .terminal: return "TERMINAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: StopType, rhs: StopType) -> Bool {
    switch (lhs, rhs) {
      case (.terminal, .terminal): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [StopType] {
    return [
      .terminal,
    ]
  }
}

public enum RouteType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case regular
  case express
  case nonstop
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "REGULAR": self = .regular
      case "EXPRESS": self = .express
      case "NONSTOP": self = .nonstop
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .regular: return "REGULAR"
      case .express: return "EXPRESS"
      case .nonstop: return "NONSTOP"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RouteType, rhs: RouteType) -> Bool {
    switch (lhs, rhs) {
      case (.regular, .regular): return true
      case (.express, .express): return true
      case (.nonstop, .nonstop): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RouteType] {
    return [
      .regular,
      .express,
      .nonstop,
    ]
  }
}

public enum Day: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  case sunday
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MONDAY": self = .monday
      case "TUESDAY": self = .tuesday
      case "WEDNESDAY": self = .wednesday
      case "THURSDAY": self = .thursday
      case "FRIDAY": self = .friday
      case "SATURDAY": self = .saturday
      case "SUNDAY": self = .sunday
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .monday: return "MONDAY"
      case .tuesday: return "TUESDAY"
      case .wednesday: return "WEDNESDAY"
      case .thursday: return "THURSDAY"
      case .friday: return "FRIDAY"
      case .saturday: return "SATURDAY"
      case .sunday: return "SUNDAY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Day, rhs: Day) -> Bool {
    switch (lhs, rhs) {
      case (.monday, .monday): return true
      case (.tuesday, .tuesday): return true
      case (.wednesday, .wednesday): return true
      case (.thursday, .thursday): return true
      case (.friday, .friday): return true
      case (.saturday, .saturday): return true
      case (.sunday, .sunday): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Day] {
    return [
      .monday,
      .tuesday,
      .wednesday,
      .thursday,
      .friday,
      .saturday,
      .sunday,
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

public final class ScanPassMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation scanPass($passId: String!, $operatorRouteId: String!, $scanningStopId: String!) {
      scanPass(passId: $passId, operatorRouteId: $operatorRouteId, scanningStopId: $scanningStopId) {
        __typename
        status
        code
        ... on PassResponse {
          pass {
            __typename
            id
            redeemDate
            redeemed
          }
        }
      }
    }
    """

  public let operationName: String = "scanPass"

  public var passId: String
  public var operatorRouteId: String
  public var scanningStopId: String

  public init(passId: String, operatorRouteId: String, scanningStopId: String) {
    self.passId = passId
    self.operatorRouteId = operatorRouteId
    self.scanningStopId = scanningStopId
  }

  public var variables: GraphQLMap? {
    return ["passId": passId, "operatorRouteId": operatorRouteId, "scanningStopId": scanningStopId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("scanPass", arguments: ["passId": GraphQLVariable("passId"), "operatorRouteId": GraphQLVariable("operatorRouteId"), "scanningStopId": GraphQLVariable("scanningStopId")], type: .object(ScanPass.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(scanPass: ScanPass? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "scanPass": scanPass.flatMap { (value: ScanPass) -> ResultMap in value.resultMap }])
    }

    public var scanPass: ScanPass? {
      get {
        return (resultMap["scanPass"] as? ResultMap).flatMap { ScanPass(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "scanPass")
      }
    }

    public struct ScanPass: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StopResponse", "StopsResponse", "OperatorRouteResponse", "OperatorRoutesResponse", "OperatorResponse", "PassResponse", "CommuterResponse", "BareOperatorResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["PassResponse": AsPassResponse.selections],
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

      public static func makeStopResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "StopResponse", "status": status, "code": code])
      }

      public static func makeStopsResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "StopsResponse", "status": status, "code": code])
      }

      public static func makeOperatorRouteResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "OperatorRouteResponse", "status": status, "code": code])
      }

      public static func makeOperatorRoutesResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "OperatorRoutesResponse", "status": status, "code": code])
      }

      public static func makeOperatorResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "OperatorResponse", "status": status, "code": code])
      }

      public static func makeCommuterResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "CommuterResponse", "status": status, "code": code])
      }

      public static func makeBareOperatorResponse(status: Bool, code: String) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "BareOperatorResponse", "status": status, "code": code])
      }

      public static func makePassResponse(status: Bool, code: String, pass: AsPassResponse.Pass? = nil) -> ScanPass {
        return ScanPass(unsafeResultMap: ["__typename": "PassResponse", "status": status, "code": code, "pass": pass.flatMap { (value: AsPassResponse.Pass) -> ResultMap in value.resultMap }])
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

      public var asPassResponse: AsPassResponse? {
        get {
          if !AsPassResponse.possibleTypes.contains(__typename) { return nil }
          return AsPassResponse(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsPassResponse: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PassResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
            GraphQLField("pass", type: .object(Pass.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: Bool, code: String, pass: Pass? = nil) {
          self.init(unsafeResultMap: ["__typename": "PassResponse", "status": status, "code": code, "pass": pass.flatMap { (value: Pass) -> ResultMap in value.resultMap }])
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

        public var pass: Pass? {
          get {
            return (resultMap["pass"] as? ResultMap).flatMap { Pass(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pass")
          }
        }

        public struct Pass: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Pass"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("redeemDate", type: .nonNull(.scalar(String.self))),
              GraphQLField("redeemed", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, redeemDate: String, redeemed: Bool) {
            self.init(unsafeResultMap: ["__typename": "Pass", "id": id, "redeemDate": redeemDate, "redeemed": redeemed])
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

          public var redeemDate: String {
            get {
              return resultMap["redeemDate"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "redeemDate")
            }
          }

          public var redeemed: Bool {
            get {
              return resultMap["redeemed"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "redeemed")
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
            type
            location
            active
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
              GraphQLField("type", type: .nonNull(.scalar(StopType.self))),
              GraphQLField("location", type: .nonNull(.scalar(String.self))),
              GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, lat: Double, lon: Double, type: StopType, location: String, active: Bool) {
            self.init(unsafeResultMap: ["__typename": "Stop", "id": id, "name": name, "lat": lat, "lon": lon, "type": type, "location": location, "active": active])
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

          public var type: StopType {
            get {
              return resultMap["type"]! as! StopType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var location: String {
            get {
              return resultMap["location"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "location")
            }
          }

          public var active: Bool {
            get {
              return resultMap["active"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "active")
            }
          }
        }
      }
    }
  }
}

public final class OperatorRoutesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query operatorRoutes {
      operatorRoutes {
        __typename
        status
        code
        ... on OperatorRoutesResponse {
          operatorRoutes {
            __typename
            id
            active
            operatorId
            routeType
            route {
              __typename
              startStopId
              endStopId
            }
            schedule {
              __typename
              day
              departureTime
              arrivalTime
            }
            intermediaries {
              __typename
              stopId
              time
            }
          }
        }
      }
    }
    """

  public let operationName: String = "operatorRoutes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("operatorRoutes", type: .nonNull(.object(OperatorRoute.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(operatorRoutes: OperatorRoute) {
      self.init(unsafeResultMap: ["__typename": "Query", "operatorRoutes": operatorRoutes.resultMap])
    }

    public var operatorRoutes: OperatorRoute {
      get {
        return OperatorRoute(unsafeResultMap: resultMap["operatorRoutes"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "operatorRoutes")
      }
    }

    public struct OperatorRoute: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StopResponse", "StopsResponse", "OperatorRouteResponse", "OperatorRoutesResponse", "OperatorResponse", "PassResponse", "CommuterResponse", "BareOperatorResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["OperatorRoutesResponse": AsOperatorRoutesResponse.selections],
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

      public static func makeStopResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "StopResponse", "status": status, "code": code])
      }

      public static func makeStopsResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "StopsResponse", "status": status, "code": code])
      }

      public static func makeOperatorRouteResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "OperatorRouteResponse", "status": status, "code": code])
      }

      public static func makeOperatorResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "OperatorResponse", "status": status, "code": code])
      }

      public static func makePassResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "PassResponse", "status": status, "code": code])
      }

      public static func makeCommuterResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "CommuterResponse", "status": status, "code": code])
      }

      public static func makeBareOperatorResponse(status: Bool, code: String) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "BareOperatorResponse", "status": status, "code": code])
      }

      public static func makeOperatorRoutesResponse(status: Bool, code: String, operatorRoutes: [AsOperatorRoutesResponse.OperatorRoute]? = nil) -> OperatorRoute {
        return OperatorRoute(unsafeResultMap: ["__typename": "OperatorRoutesResponse", "status": status, "code": code, "operatorRoutes": operatorRoutes.flatMap { (value: [AsOperatorRoutesResponse.OperatorRoute]) -> [ResultMap] in value.map { (value: AsOperatorRoutesResponse.OperatorRoute) -> ResultMap in value.resultMap } }])
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

      public var asOperatorRoutesResponse: AsOperatorRoutesResponse? {
        get {
          if !AsOperatorRoutesResponse.possibleTypes.contains(__typename) { return nil }
          return AsOperatorRoutesResponse(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsOperatorRoutesResponse: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OperatorRoutesResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
            GraphQLField("operatorRoutes", type: .list(.nonNull(.object(OperatorRoute.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: Bool, code: String, operatorRoutes: [OperatorRoute]? = nil) {
          self.init(unsafeResultMap: ["__typename": "OperatorRoutesResponse", "status": status, "code": code, "operatorRoutes": operatorRoutes.flatMap { (value: [OperatorRoute]) -> [ResultMap] in value.map { (value: OperatorRoute) -> ResultMap in value.resultMap } }])
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

        public var operatorRoutes: [OperatorRoute]? {
          get {
            return (resultMap["operatorRoutes"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [OperatorRoute] in value.map { (value: ResultMap) -> OperatorRoute in OperatorRoute(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [OperatorRoute]) -> [ResultMap] in value.map { (value: OperatorRoute) -> ResultMap in value.resultMap } }, forKey: "operatorRoutes")
          }
        }

        public struct OperatorRoute: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["OperatorRoute"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("operatorId", type: .nonNull(.scalar(String.self))),
              GraphQLField("routeType", type: .nonNull(.scalar(RouteType.self))),
              GraphQLField("route", type: .nonNull(.object(Route.selections))),
              GraphQLField("schedule", type: .list(.nonNull(.object(Schedule.selections)))),
              GraphQLField("intermediaries", type: .list(.nonNull(.object(Intermediary.selections)))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, active: Bool, operatorId: String, routeType: RouteType, route: Route, schedule: [Schedule]? = nil, intermediaries: [Intermediary]? = nil) {
            self.init(unsafeResultMap: ["__typename": "OperatorRoute", "id": id, "active": active, "operatorId": operatorId, "routeType": routeType, "route": route.resultMap, "schedule": schedule.flatMap { (value: [Schedule]) -> [ResultMap] in value.map { (value: Schedule) -> ResultMap in value.resultMap } }, "intermediaries": intermediaries.flatMap { (value: [Intermediary]) -> [ResultMap] in value.map { (value: Intermediary) -> ResultMap in value.resultMap } }])
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

          public var active: Bool {
            get {
              return resultMap["active"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "active")
            }
          }

          public var operatorId: String {
            get {
              return resultMap["operatorId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "operatorId")
            }
          }

          public var routeType: RouteType {
            get {
              return resultMap["routeType"]! as! RouteType
            }
            set {
              resultMap.updateValue(newValue, forKey: "routeType")
            }
          }

          public var route: Route {
            get {
              return Route(unsafeResultMap: resultMap["route"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "route")
            }
          }

          public var schedule: [Schedule]? {
            get {
              return (resultMap["schedule"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Schedule] in value.map { (value: ResultMap) -> Schedule in Schedule(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Schedule]) -> [ResultMap] in value.map { (value: Schedule) -> ResultMap in value.resultMap } }, forKey: "schedule")
            }
          }

          public var intermediaries: [Intermediary]? {
            get {
              return (resultMap["intermediaries"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Intermediary] in value.map { (value: ResultMap) -> Intermediary in Intermediary(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Intermediary]) -> [ResultMap] in value.map { (value: Intermediary) -> ResultMap in value.resultMap } }, forKey: "intermediaries")
            }
          }

          public struct Route: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Route"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("startStopId", type: .nonNull(.scalar(String.self))),
                GraphQLField("endStopId", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(startStopId: String, endStopId: String) {
              self.init(unsafeResultMap: ["__typename": "Route", "startStopId": startStopId, "endStopId": endStopId])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var startStopId: String {
              get {
                return resultMap["startStopId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "startStopId")
              }
            }

            public var endStopId: String {
              get {
                return resultMap["endStopId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "endStopId")
              }
            }
          }

          public struct Schedule: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Schedule"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("day", type: .nonNull(.scalar(Day.self))),
                GraphQLField("departureTime", type: .nonNull(.scalar(String.self))),
                GraphQLField("arrivalTime", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(day: Day, departureTime: String, arrivalTime: String) {
              self.init(unsafeResultMap: ["__typename": "Schedule", "day": day, "departureTime": departureTime, "arrivalTime": arrivalTime])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var day: Day {
              get {
                return resultMap["day"]! as! Day
              }
              set {
                resultMap.updateValue(newValue, forKey: "day")
              }
            }

            public var departureTime: String {
              get {
                return resultMap["departureTime"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "departureTime")
              }
            }

            public var arrivalTime: String {
              get {
                return resultMap["arrivalTime"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "arrivalTime")
              }
            }
          }

          public struct Intermediary: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Intermediary"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("stopId", type: .nonNull(.scalar(String.self))),
                GraphQLField("time", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(stopId: String, time: String) {
              self.init(unsafeResultMap: ["__typename": "Intermediary", "stopId": stopId, "time": time])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var stopId: String {
              get {
                return resultMap["stopId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "stopId")
              }
            }

            public var time: String {
              get {
                return resultMap["time"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "time")
              }
            }
          }
        }
      }
    }
  }
}

public final class ActiveOperatorRoutesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query activeOperatorRoutes {
      activeOperatorRoutes {
        __typename
        status
        code
        ... on OperatorRoutesResponse {
          operatorRoutes {
            __typename
            id
            active
            operatorId
            routeType
            route {
              __typename
              startStopId
              endStopId
            }
            schedule {
              __typename
              day
              departureTime
              arrivalTime
            }
            intermediaries {
              __typename
              stopId
              time
            }
          }
        }
      }
    }
    """

  public let operationName: String = "activeOperatorRoutes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("activeOperatorRoutes", type: .nonNull(.object(ActiveOperatorRoute.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(activeOperatorRoutes: ActiveOperatorRoute) {
      self.init(unsafeResultMap: ["__typename": "Query", "activeOperatorRoutes": activeOperatorRoutes.resultMap])
    }

    public var activeOperatorRoutes: ActiveOperatorRoute {
      get {
        return ActiveOperatorRoute(unsafeResultMap: resultMap["activeOperatorRoutes"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "activeOperatorRoutes")
      }
    }

    public struct ActiveOperatorRoute: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StopResponse", "StopsResponse", "OperatorRouteResponse", "OperatorRoutesResponse", "OperatorResponse", "PassResponse", "CommuterResponse", "BareOperatorResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["OperatorRoutesResponse": AsOperatorRoutesResponse.selections],
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

      public static func makeStopResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "StopResponse", "status": status, "code": code])
      }

      public static func makeStopsResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "StopsResponse", "status": status, "code": code])
      }

      public static func makeOperatorRouteResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "OperatorRouteResponse", "status": status, "code": code])
      }

      public static func makeOperatorResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "OperatorResponse", "status": status, "code": code])
      }

      public static func makePassResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "PassResponse", "status": status, "code": code])
      }

      public static func makeCommuterResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "CommuterResponse", "status": status, "code": code])
      }

      public static func makeBareOperatorResponse(status: Bool, code: String) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "BareOperatorResponse", "status": status, "code": code])
      }

      public static func makeOperatorRoutesResponse(status: Bool, code: String, operatorRoutes: [AsOperatorRoutesResponse.OperatorRoute]? = nil) -> ActiveOperatorRoute {
        return ActiveOperatorRoute(unsafeResultMap: ["__typename": "OperatorRoutesResponse", "status": status, "code": code, "operatorRoutes": operatorRoutes.flatMap { (value: [AsOperatorRoutesResponse.OperatorRoute]) -> [ResultMap] in value.map { (value: AsOperatorRoutesResponse.OperatorRoute) -> ResultMap in value.resultMap } }])
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

      public var asOperatorRoutesResponse: AsOperatorRoutesResponse? {
        get {
          if !AsOperatorRoutesResponse.possibleTypes.contains(__typename) { return nil }
          return AsOperatorRoutesResponse(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsOperatorRoutesResponse: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OperatorRoutesResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("status", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
            GraphQLField("operatorRoutes", type: .list(.nonNull(.object(OperatorRoute.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(status: Bool, code: String, operatorRoutes: [OperatorRoute]? = nil) {
          self.init(unsafeResultMap: ["__typename": "OperatorRoutesResponse", "status": status, "code": code, "operatorRoutes": operatorRoutes.flatMap { (value: [OperatorRoute]) -> [ResultMap] in value.map { (value: OperatorRoute) -> ResultMap in value.resultMap } }])
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

        public var operatorRoutes: [OperatorRoute]? {
          get {
            return (resultMap["operatorRoutes"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [OperatorRoute] in value.map { (value: ResultMap) -> OperatorRoute in OperatorRoute(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [OperatorRoute]) -> [ResultMap] in value.map { (value: OperatorRoute) -> ResultMap in value.resultMap } }, forKey: "operatorRoutes")
          }
        }

        public struct OperatorRoute: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["OperatorRoute"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("operatorId", type: .nonNull(.scalar(String.self))),
              GraphQLField("routeType", type: .nonNull(.scalar(RouteType.self))),
              GraphQLField("route", type: .nonNull(.object(Route.selections))),
              GraphQLField("schedule", type: .list(.nonNull(.object(Schedule.selections)))),
              GraphQLField("intermediaries", type: .list(.nonNull(.object(Intermediary.selections)))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, active: Bool, operatorId: String, routeType: RouteType, route: Route, schedule: [Schedule]? = nil, intermediaries: [Intermediary]? = nil) {
            self.init(unsafeResultMap: ["__typename": "OperatorRoute", "id": id, "active": active, "operatorId": operatorId, "routeType": routeType, "route": route.resultMap, "schedule": schedule.flatMap { (value: [Schedule]) -> [ResultMap] in value.map { (value: Schedule) -> ResultMap in value.resultMap } }, "intermediaries": intermediaries.flatMap { (value: [Intermediary]) -> [ResultMap] in value.map { (value: Intermediary) -> ResultMap in value.resultMap } }])
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

          public var active: Bool {
            get {
              return resultMap["active"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "active")
            }
          }

          public var operatorId: String {
            get {
              return resultMap["operatorId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "operatorId")
            }
          }

          public var routeType: RouteType {
            get {
              return resultMap["routeType"]! as! RouteType
            }
            set {
              resultMap.updateValue(newValue, forKey: "routeType")
            }
          }

          public var route: Route {
            get {
              return Route(unsafeResultMap: resultMap["route"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "route")
            }
          }

          public var schedule: [Schedule]? {
            get {
              return (resultMap["schedule"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Schedule] in value.map { (value: ResultMap) -> Schedule in Schedule(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Schedule]) -> [ResultMap] in value.map { (value: Schedule) -> ResultMap in value.resultMap } }, forKey: "schedule")
            }
          }

          public var intermediaries: [Intermediary]? {
            get {
              return (resultMap["intermediaries"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Intermediary] in value.map { (value: ResultMap) -> Intermediary in Intermediary(unsafeResultMap: value) } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Intermediary]) -> [ResultMap] in value.map { (value: Intermediary) -> ResultMap in value.resultMap } }, forKey: "intermediaries")
            }
          }

          public struct Route: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Route"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("startStopId", type: .nonNull(.scalar(String.self))),
                GraphQLField("endStopId", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(startStopId: String, endStopId: String) {
              self.init(unsafeResultMap: ["__typename": "Route", "startStopId": startStopId, "endStopId": endStopId])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var startStopId: String {
              get {
                return resultMap["startStopId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "startStopId")
              }
            }

            public var endStopId: String {
              get {
                return resultMap["endStopId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "endStopId")
              }
            }
          }

          public struct Schedule: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Schedule"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("day", type: .nonNull(.scalar(Day.self))),
                GraphQLField("departureTime", type: .nonNull(.scalar(String.self))),
                GraphQLField("arrivalTime", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(day: Day, departureTime: String, arrivalTime: String) {
              self.init(unsafeResultMap: ["__typename": "Schedule", "day": day, "departureTime": departureTime, "arrivalTime": arrivalTime])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var day: Day {
              get {
                return resultMap["day"]! as! Day
              }
              set {
                resultMap.updateValue(newValue, forKey: "day")
              }
            }

            public var departureTime: String {
              get {
                return resultMap["departureTime"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "departureTime")
              }
            }

            public var arrivalTime: String {
              get {
                return resultMap["arrivalTime"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "arrivalTime")
              }
            }
          }

          public struct Intermediary: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Intermediary"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("stopId", type: .nonNull(.scalar(String.self))),
                GraphQLField("time", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(stopId: String, time: String) {
              self.init(unsafeResultMap: ["__typename": "Intermediary", "stopId": stopId, "time": time])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var stopId: String {
              get {
                return resultMap["stopId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "stopId")
              }
            }

            public var time: String {
              get {
                return resultMap["time"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "time")
              }
            }
          }
        }
      }
    }
  }
}
