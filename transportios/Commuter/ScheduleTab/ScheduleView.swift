//
//  ScheduleView.swift
//  transportios
//
//  Created by grid on 2020-11-26.
//

import SwiftUI

struct ScheduleView: View {
    @ObservedObject var scheduleViewVM: ScheduleViewModel
    var body: some View{
        VStack(alignment: .leading){
            HStack(alignment: .top){
                
                Text(scheduleViewVM.schedule.departureTime)
                        .font(.caption)
                        .offset(x: -UIScreen.main.bounds.width/3)
                      
                
                
                Text(scheduleViewVM.schedule.arrivalTime)
                        .font(.caption)
                        .offset(x: UIScreen.main.bounds.width/4)
                
            }
            .frame(width: UIScreen.main.bounds.width)
            .foregroundColor(Color.orange)
            HStack{
                Text(scheduleViewVM.schedule.startStopName)
                    .font(.caption)
                Image(systemName: "arrow.right.square")
                    .foregroundColor(Color.green)
                Text(scheduleViewVM.schedule.endStopName)
                    .font(.caption)
            }
            HStack{
                Image(systemName: "arrow.down.square")
                    .foregroundColor(Color.blue)
                Text("In Between Stops")
                    .font(.caption)
                    .foregroundColor(Color.blue)
            }
            HStack{
                VStack(alignment: .leading){
                    ForEach(scheduleViewVM.schedule.intermediaries, id: \.self) {
                        intermediary in
                        Text(intermediary.time)
                            .font(.caption)
  
                    }
    
                }
                VStack(alignment: .leading){
                    ForEach(scheduleViewVM.schedule.intermediaries, id: \.self) {
                        intermediary in
                        Text(intermediary.stopName)
                            .font(.caption)
  
                    }

   
                }
                Text(scheduleViewVM.schedule.routeType)
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                    .offset(x: UIScreen.main.bounds.width/7)
            
            }


                
        }
        
    }
    
}
