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
    @State var text = ""
//    @State var days: [DayControl] = [DayControl(name: "SUNDAY", shortName: "SUN") ,DayControl(name: "MONDAY", shortName: "MON"),
//                                            DayControl(name: "TUESDAY", shortName: "TUE"),
//                                            DayControl(name: "WEDNESDAY", shortName: "WED"),
//                                            DayControl(name: "THURSDAY", shortName: "THU"),
//                                            DayControl(name: "FRIDAY", shortName: "FRI"), DayControl(name: "SATURDAY", shortName: "SAT")]
    var body: some View{
        VStack{
            
            TextField("Search", text: $scheduleTabVM.search)
            .border(Color.blue)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.subheadline)
            .padding()
            //.offset(y: -UIScreen.main.bounds.height/10)
                
            HStack{
                ForEach(0..<scheduleTabVM.days.count){ index in
                    Button(scheduleTabVM.days[index].shortName, action: {
                        self.scheduleTabVM.selectDay(index: index)
                       
                })
                .padding(4)
                    .foregroundColor(scheduleTabVM.days[index].color)
                .font(.subheadline)
                }
            }
            //.offset(y: -UIScreen.main.bounds.height/9)
            List{
                ForEach(scheduleTabVM.displayRoutes, id: \.self) {
                    displayRoute in


                    ScheduleView(scheduleViewVM: ScheduleViewModel(displayRoute: displayRoute))

                }

            }
            
            

            
            
            
//            List(scheduleTabVM.displayRoutes.filter({
//                if(searchParam.isEmpty){
//                    return true
////                    for day in scheduleTabVM.days {
////                        if(day.isSelected){
////                            if(day.name == $0.day){
////                                return true
////                            }
////                        }
////                    }
////                    return false
//                }else{
//                    for day in scheduleTabVM.days {
//                        if(day.isSelected){
//                            if(day.name == $0.day){
//                                //return true
//                                if ($0.startStopName.uppercased().contains(searchParam.uppercased())) || ($0.endStopName.uppercased().contains(searchParam.uppercased())){
//                                    return true
//                                }else{
//                                    for intermediary in $0.intermediaries {
//                                        if(intermediary.stopName.uppercased().contains(searchParam.uppercased())){
//                                            return true
//                                        }
//                                    }
//                                    return false
//                                }
//                            }
//                        }
//                    }
//                    return false
//
//                }
//                //searchParam.isEmpty ? true : ($0.startStopName.contains(searchParam))
//
//            })) { displayRoute in
//                ScheduleView(scheduleViewVM: ScheduleViewModel(displayRoute: displayRoute))
//            }
            
  
            
            
        }
      
        
    }
}


struct DayControl{
        var id = UUID()
        var name: String
        var shortName: String
        var isSelected: Bool = false
        var color = Color.gray
}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        print(text)
    }
}
