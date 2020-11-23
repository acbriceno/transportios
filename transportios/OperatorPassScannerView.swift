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
    var body: some View {
        
        VStack{
            Text("Select Operator Route")
                .padding()
            Picker("Select Route", selection: $selectedRoute) {
                ForEach(opsModel.operatorRoutes, id: \.self) {
                    operatorRoute in
                    VStack{
                    Text(opsModel.getStops(stopId: operatorRoute.route.startStopId) + "->")
                        .minimumScaleFactor(0.5)
    
                        Text( opsModel.getStops(stopId: operatorRoute.route.endStopId))
                            .minimumScaleFactor(0.5)
                        
                    }
                }
            }
            .onChange(of: selectedRoute, perform: { value in
                opsModel.createScanningStops(operatorRouteId: selectedRoute.id)
            })
            .padding(5)
            
            if (opsModel.scanningStops.count != 0){
                Text("Select Scanning Stop")
                Picker("Select Scanning Stop", selection: $selectedScanningStop) {
                    ForEach(opsModel.scanningStops, id: \.self) {
                        scanningStop in
                        VStack{
                            Text(scanningStop.name)
                            .minimumScaleFactor(0.5)
    
                            
                        }
                    }
                    
                }.padding(5)
            }
          
            Text("Scan")
            .padding()
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
//opsModel.getStops(stopId: opsModel.operatorRoutes[index].route.startStopId)
