//
//  OperatorPassScaner.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import Foundation

class OperatorPassScanner: ObservableObject{
    var stops = [Stop]()
    @Published var operatorRoutes = [OperatorRoute]()
    @Published var scanningStops = [Stop]()
    
    
    init(){
        DispatchQueue.global(qos: .userInteractive).async {
            self.loadStops()
            
            
        
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
    func createScanningStops(operatorRouteId: String){
        self.scanningStops = [Stop]()
        for operatorRoute in operatorRoutes{
            if(operatorRoute.id == operatorRouteId){
                let tempStartStop = Stop(id: operatorRoute.route.startStopId, name: self.getStops(stopId: operatorRoute.route.startStopId))
                self.scanningStops.append(tempStartStop)
                for intermediary in operatorRoute.intermediaries {
                    let tempIntermediaryStop = Stop(id:intermediary.stopId, name: self.getStops(stopId: intermediary.stopId))
                    self.scanningStops.append(tempIntermediaryStop)
                }
            }
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
                    self.loadOperatorRoutes()
                }
            }
                
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    
    func loadOperatorRoutes(){
        Network.shared.apollo.fetch(query: OperatorRoutesQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            //print("Success! Result: \(graphQLResult)")
            if let status = graphQLResult.data?.operatorRoutes.asOperatorRoutesResponse?.status{
                print(status)
                if(status){
                    let operatorRoutesContainer = graphQLResult.data?.operatorRoutes.asOperatorRoutesResponse?.operatorRoutes
                    var tempOpRoutes = [OperatorRoute]()
                    for operatorRoute in operatorRoutesContainer!{
                        //print(operatorRoute.jsonObject)
                        let tempRoute = OperatorRoute(operatorRoute: operatorRoute)
                        //self.operatorRoutes.append(tempRoute)
                        tempOpRoutes.append(tempRoute)
                    }
                    DispatchQueue.main.async {
                        self.operatorRoutes = tempOpRoutes
                    }
                    
                }
            }
         
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
}
