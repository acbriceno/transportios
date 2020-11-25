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
    @State private var logoutState = false
    var opsRouteVM = OpRouteScannerViewModel(scanningStop: "",  operatorRouteId: "")
    var body: some View {
        VStack{
            VStack{

            Form{
                
                Section{
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
                            
                        }.padding()
      
                    }
                }
                .onChange(of: selectedRoute, perform: { value in
                    self.bothSelected = false
                    self.selectedStop  = Stop()
                    opsModel.createScanningStops(operatorRouteId: selectedRoute.id)
                    })
                
                }
                
                
                
                if (opsModel.scanningStops.count != 0){
                    Section{
                   Picker("Scanning Stop", selection: $selectedStop) {
                       ForEach(opsModel.scanningStops, id: \.self) {
                           scanningStop in
                           VStack{
                               Text(scanningStop.name)
                               .minimumScaleFactor(0.5)
                           }.padding()
                       }
   
                   }
                   .onChange(of: selectedStop, perform: { value in
                        self.bothSelected = true
                   })
                    }
                    
                    if(bothSelected){
                        Section{
                            Button("Scan Pass", action: {
                                self.opsRouteVM.scanningStopId = selectedStop.id
                                self.opsRouteVM.operatorRouteId = selectedRoute.id
                                self.scanReady = true
                            })
                        }
                    }
            }
                
                Section{
                    Button("Log out", action: {
                        logoutState = true
                    })
                }
                
                
        }
            NavigationLink(
                destination: OpRouteScannerView(opRouteScannerVM: opsRouteVM),
                isActive: $scanReady
                ){
                EmptyView()
            }
                
            NavigationLink(
                destination: LoginView(authViewModel: AccountManager()),
                isActive: $logoutState
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
