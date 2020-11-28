//
//  ScheduleTabViewModel.swift
//  transportios
//
//  Created by grid on 2020-11-26.
//

import Foundation
import SwiftUI
class ScheduleTabViewModel: ObservableObject {
    var stops =  [Stop]()
    var routes = [OperatorRoute]()
    @Published var displayRoutes  = [DisplayRoute]()
    var historyRoutes = [DisplayRoute]()
    var days: [DayControl] = [DayControl(name: "SUNDAY", shortName: "SUN") ,DayControl(name: "MONDAY", shortName: "MON"),
                                            DayControl(name: "TUESDAY", shortName: "TUE"),
                                            DayControl(name: "WEDNESDAY", shortName: "WED"),
                                            DayControl(name: "THURSDAY", shortName: "THU"),
                                            DayControl(name: "FRIDAY", shortName: "FRI"), DayControl(name: "SATURDAY", shortName: "SAT")]
    
    var searchParam = ""
    var search: String{
        get{
            return searchParam
        }
        set(newSearch){
            print(newSearch)
            searchParam = newSearch
            self.applyFilters()
        }
        
    }
    
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
                    
                        
                           
                        self.displayRoutes = tempDisplayRoutes
                        self.historyRoutes = tempDisplayRoutes
                       // print(self.displayRoutes)
                        var today = Date()
                        self.selectDay(index: today.get(.weekday) - 1)
                        print(today.get(.weekday))
                        
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
    func selectDay(index: Int){
        
            self.days[index].isSelected = !self.days[index].isSelected
            self.days[index].color = self.days[index].isSelected ?  Color.blue : Color.gray
            applyFilters()

    }
    
    func applyFilters(){
        var dayFilteredRoutes = applyDayFilter(routes: self.historyRoutes)
        var searchFilterRoutes = applySeachFilter(routes: dayFilteredRoutes)
        DispatchQueue.main.async {
            self.objectWillChange.send()
            self.displayRoutes = searchFilterRoutes
        }
    }
    
    func applyDayFilter(routes: [DisplayRoute]) -> [DisplayRoute]{
        let dayFilter = days.filter({
            return $0.isSelected
        })
        print(dayFilter.count)
        if(dayFilter.count == 0){
                //self.displayRoutes = self.historyRoutes
            return routes
            
        }else{
            var tempDisplayRoutes = [DisplayRoute]()
            for route in routes {
                for day in dayFilter{
                    if(route.day == day.name){
                        tempDisplayRoutes.append(route)
                        
                    }
                }
            }
               return tempDisplayRoutes
                //self.displayRoutes = tempDisplayRoutes
            
        }
    }


func applySeachFilter(routes: [DisplayRoute]) -> [DisplayRoute]{
    var tempRoutes = [DisplayRoute]()
    if(searchParam.isEmpty){
        return routes
    }else{
        for route in routes{
            if (route.startStopName.uppercased().contains(searchParam.uppercased()) || route.endStopName.uppercased().contains(searchParam.uppercased()) ) {
                tempRoutes.append(route)
            }else{
                for intermediary in route.intermediaries {
                    if(intermediary.stopName.uppercased().contains(searchParam.uppercased())){
                        tempRoutes.append(route)
                        break
                    }
                }
            }
        }
    }
    
    return tempRoutes
}
    
}
struct DisplayRoute: Hashable, Identifiable {
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

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
