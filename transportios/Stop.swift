//
//  Stop.swift
//  transportios
//
//  Created by grid on 2020-11-23.
//

import Foundation

struct Stop : Hashable {
    var id: String = ""
    var lat: Double = 0.0
    var lon: Double = 0.0
    var name: String = ""
    var type: StopType = .terminal
    var location: String = ""
    var active: Bool = false
    
    init(id: String, name: String){
        self.id = id
        self.name = name
    }
    
    init(stop: StopsQuery.Data.Stop.AsStopsResponse.Stop){
        id = stop.id
        lat = stop.lat
        lon = stop.lon
        name = stop.name
        type = stop.type
        location = stop.location
        active = stop.active
    }
}
