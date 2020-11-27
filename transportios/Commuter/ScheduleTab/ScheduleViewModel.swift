//
//  ScheduleViewModel.swift
//  transportios
//
//  Created by grid on 2020-11-26.
//


import Foundation

class ScheduleViewModel: ObservableObject {
  
    @Published var schedule: DisplayRoute
    
    init(displayRoute: DisplayRoute){
        self.schedule = displayRoute
    }
}
