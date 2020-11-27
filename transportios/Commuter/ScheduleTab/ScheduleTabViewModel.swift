//
//  ScheduleTabViewModel.swift
//  transportios
//
//  Created by grid on 2020-11-26.
//

import Foundation
class ScheduleTabViewModel: ObservableObject {
    var stops =  [Stop]()
    var routes = [OperatorRoute]()
    @Published var displayRoutes  = [DisplayRoute]()
    
    init(){
        DispatchQueue.global(qos: .userInteractive).async {
            self.loadStops()
        
        }
    }
    
    func loadStops(){
        Network.shared.apollo.fetch(query: StopsQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            //print("Success! Result: \(graphQLResult)")
            if let status = graphQLResult.data?.stops.asStopsResponse?.status{
                print(status)
                if(status){
                    let stopsContainer = graphQLResult.data?.stops.asStopsResponse?.stops
                    for stop in stopsContainer!{
                        let tempStop = Stop(stop: stop)
                        self.stops.append(tempStop)
                    }
                    self.loadActiveOperatorRoutes()
                }
            }
                
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    
    func loadActiveOperatorRoutes(){
        Network.shared.apollo.fetch(query: ActiveOperatorRoutesQuery()) { result in
          switch result {
          case .success(let graphQLResult):
           // print("Success! Result: \(graphQLResult)")
            if let status = graphQLResult.data?.activeOperatorRoutes.status{
                if(status){
                    if let routesContainer = graphQLResult.data?.activeOperatorRoutes.asOperatorRoutesResponse?.operatorRoutes{
                        var tempDisplayRoutes = [DisplayRoute]()
                        for route in routesContainer{
                            
                            if let schedules = route.schedule{
                                for schedule in schedules{
                                    if let intermediaries = route.intermediaries{
                                        var intermediaryContainer = [DisplayIntermediary]()
                                        for intermediary in intermediaries {
                                            var tempIntermediary = DisplayIntermediary(stopName: self.getStops(stopId: intermediary.stopId), time: intermediary.time )
                                            intermediaryContainer.append(tempIntermediary)
                                        }
                                        //let temDiplayRoute = DisplayRoute(id: "", startStopName: "", endStopName: "", arrivalTime: "", departureTime: "", routeType: "", intermediaries: intermediaryContainer, day: "")
                                        let tempDisplayRoute = DisplayRoute(id: route.id, startStopName: self.getStops(stopId: route.route.startStopId), endStopName: self.getStops(stopId: route.route.endStopId), arrivalTime: schedule.arrivalTime, departureTime: schedule.departureTime, routeType: route.routeType.rawValue, intermediaries: intermediaryContainer, day: schedule.day.rawValue)
                                        tempDisplayRoutes.append(tempDisplayRoute)
                                    }
                                }
   
                            }
      

     
                        }
                        DispatchQueue.main.async {
                            self.objectWillChange.send()
                            self.displayRoutes = tempDisplayRoutes
                            print(self.displayRoutes.count)
                        }
                        //update displayRoutes and update View
                    }

                }
            }

         
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    func getStops(stopId: String) -> String {
        for stop in stops{
            if(stopId == stop.id){
                return stop.name
            }
        }
        return ""
    }
}

struct DisplayRoute: Hashable {
    var id: String
    var startStopName: String
    var endStopName: String
    var arrivalTime: String
    var departureTime: String
    var routeType: String
    var intermediaries: [DisplayIntermediary]
    var day: String
    
    init(id: String, startStopName: String, endStopName: String, arrivalTime: String, departureTime: String, routeType: String, intermediaries: [DisplayIntermediary], day: String){
        
        self.id = id
        self.startStopName = startStopName
        self.endStopName = endStopName
        self.arrivalTime = arrivalTime
        self.departureTime = departureTime
        self.routeType = routeType
        self.intermediaries = intermediaries
        self.day = day
    }
}
struct DisplayIntermediary: Hashable{
    let stopName: String
    let time: String
    
    init(stopName: String, time: String){
        self.stopName = stopName
        self.time = time
    }
}

