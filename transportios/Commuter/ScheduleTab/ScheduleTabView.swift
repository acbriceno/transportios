//
//  ScheduleTabView.swift
//  transportios
//
//  Created by grid on 2020-11-26.
//

import SwiftUI

struct ScheduleTabView: View {
    @ObservedObject var scheduleTabVM = ScheduleTabViewModel()
    @State var searchParam: String
    @State var days: [DayControl] = [DayControl(name: "SUN") ,DayControl(name: "MON"),
                                            DayControl(name: "TUE"),
                                            DayControl(name: "WED"),
                                            DayControl(name: "THU"),
                                            DayControl(name: "FRI"), DayControl(name: "SAT")]
    var body: some View{
        VStack{
            
            TextField("Search", text: $searchParam)
            .border(Color.blue)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            //.offset(y: -UIScreen.main.bounds.height/10)
                
            HStack{
                ForEach(0..<days.count){ index in
                    Button(days[index].name, action: {
                       
                })
                .padding(4)
                .foregroundColor(days[index].color)
                .font(.subheadline)
                }
            }
            //.offset(y: -UIScreen.main.bounds.height/9)
//            List{
//                ForEach(scheduleTabVM.displayRoutes, id: \.self) {
//                    displayRoute in
//
//                    ScheduleView(scheduleViewVM: ScheduleViewModel(displayRoute: displayRoute))
//
//                }
//
//            }
            List(scheduleTabVM.displayRoutes.filter({
                //var text = self.searchParam.uppercased()
                if(searchParam.isEmpty){
                    return true
                }else{
                    if ($0.startStopName.uppercased().contains(searchParam.uppercased())) || ($0.endStopName.uppercased().contains(searchParam.uppercased())){
                        return true
                    }else{
                        for intermediary in $0.intermediaries {
                            if(intermediary.stopName.uppercased().contains(searchParam.uppercased())){
                                return true
                            }
                        }
                        return false
                    }
                }
                //searchParam.isEmpty ? true : ($0.startStopName.contains(searchParam))
                
            })) { displayRoute in
                ScheduleView(scheduleViewVM: ScheduleViewModel(displayRoute: displayRoute))
            }
            
       //    List(todoItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
              //  Text(item.name)
        //    }
  
            
            
        }
      
        
    }
}


struct DayControl{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
        var color = Color.gray
}
