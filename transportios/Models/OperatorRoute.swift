//
//  OperatorRoute.swift
//  transportios
//
//  Created by grid on 2020-11-23.
//

import Foundation

struct OperatorRoute: Hashable{
  
    
    var id: String = ""
    var active: Bool = false
    var operatorId: String = ""
    var route: Route = Route(startingStopId: "1", endStopId: "2")
    var schedule = [Schedule]()
    var intermediaries = [Intermediary]()
    var routeType: String = ""
    
    init(){
        
    }
    
    init(operatorRoute: OperatorRoutesQuery.Data.OperatorRoute.AsOperatorRoutesResponse.OperatorRoute){
        id = operatorRoute.id
        active = operatorRoute.active
        operatorId = operatorRoute.operatorId
        route = Route(startingStopId: operatorRoute.route.startStopId, endStopId: operatorRoute.route.endStopId)
        routeType = operatorRoute.routeType.rawValue
        for sc in operatorRoute.schedule!{
            let tempSchedule = Schedule(departureTime: sc.departureTime, arrivalTime: sc.arrivalTime, day: sc.day.rawValue)
            schedule.append(tempSchedule)
        }
        
        for intermediary in operatorRoute.intermediaries!{
            let tempIntermediary = Intermediary(intermediary: intermediary)
            intermediaries.append(tempIntermediary)
        }
    }
}

struct Route: Hashable{
    let startStopId: String
    let endStopId: String
    
    init(startingStopId: String, endStopId: String){
        self.startStopId = startingStopId
        self.endStopId = endStopId
    }
}

struct Schedule : Hashable{
    let departureTime: String
    let arrivalTime: String
    let day: String
    
    init(departureTime: String, arrivalTime: String, day: String){
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.day = day
    }
}

struct Intermediary: Hashable{
    let stopId: String
    let time: String
    
    init(intermediary: OperatorRoutesQuery.Data.OperatorRoute.AsOperatorRoutesResponse.OperatorRoute.Intermediary){
        stopId = intermediary.stopId
        time = intermediary.time
    }
}

