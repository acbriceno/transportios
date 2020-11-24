//
//  OperatorPassScannerView.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//


import SwiftUI




struct OperatorPassScanerView: View {
    @ObservedObject var opsModel = OperatorPassScanner()
    @State var selectedScanningStop = [Stop]()
    @State var selectedRoute = OperatorRoute()
    @State var selectedStop = Stop()
    @State private var scanReady = false
    @State private var bothSelected = false
    var body: some View {
        VStack{
            VStack{

            Form{
                
                Picker("Route", selection: $selectedRoute) {
                    ForEach(opsModel.operatorRoutes, id: \.self) {
                        operatorRoute in
                        
                        
                        HStack{
                            VStack{
                                Text("Departure").padding(2)
                                Text("Arrival").padding(2)
                            }
                            VStack{
                                Text(opsModel.getStops(stopId: operatorRoute.route.startStopId))
                                    .padding(2)
            
                                Text(opsModel.getStops(stopId: operatorRoute.route.endStopId))
                                    .padding(2)
                            }
                            
                        }
      
                    }
                }
                .onChange(of: selectedRoute, perform: { value in
                    self.bothSelected = false
                    self.selectedStop  = Stop()
                    opsModel.createScanningStops(operatorRouteId: selectedRoute.id)
                    })
                
                if (opsModel.scanningStops.count != 0){
                   Picker("Scanning Stop", selection: $selectedStop) {
                       ForEach(opsModel.scanningStops, id: \.self) {
                           scanningStop in
                           VStack{
                               Text(scanningStop.name)
                               .minimumScaleFactor(0.5)
                           }
                       }
   
                   }
                   .onChange(of: selectedStop, perform: { value in
                        self.bothSelected = true
                   })
                    if(bothSelected){
                        Section{
                            Button("Scan Pass", action: {
                                self.scanReady = true
                            })
                        }
                    }

                
            }
        }
            NavigationLink(
                destination: ScannerTestView(),
                isActive: $scanReady
                ){
                EmptyView()
            }
        
        }
        .navigationBarTitle("Pass Scanner")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OperatorPassScannerView_Previews: PreviewProvider {
    static var previews: some View {
      OperatorPassScanerView()
    }
}
