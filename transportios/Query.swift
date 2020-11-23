//
//  Query.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import Foundation

class QueryController{
    var stops = [[String: Any?]]()
    init(){
        Network.shared.apollo.fetch(query: StopsQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            //print("Success! Result: \(graphQLResult)")
            if let status = graphQLResult.data?.stops.asStopsResponse?.status{
                print(status)
                if(status){
                    //print( graphQLResult.data?.resultMap["stops"]!)
                    let stopsContainer = graphQLResult.data?.stops.asStopsResponse?.stops
                    //self.stops.append(contentsOf: (stopsContainer?.compactMap { $0 })!)
                    //print(stopsContainer!)
                    for stop in stopsContainer!{
                      //  print(stop.resultMap)
                        //self.stops = [stop.resultMap]
                        self.stops.append(stop.resultMap)
                        
                    }
                    print(self.stops)
                    
                }
                
            }
         
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
     
      
     
    
}
