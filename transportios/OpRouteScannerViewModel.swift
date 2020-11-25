//
//  OpRouteScannerViewModel.swift
//  transportios
//
//  Created by grid on 2020-11-25.
//

import Foundation
import SwiftUI
class OpRouteScannerViewModel: ObservableObject {
    var scanningStopId: String
    var passServerResponse = false
    @Published var scanState: PassScanState = .pending
    var scanStateColor = Color.blue
    var operatorRouteId: String
    var timer: Double = 0
    var scanInterval:Double = 5.0
    var status = false
    var passId: String = ""{
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + scanInterval){
                if(self.status){
                    self.scanStateColor = Color.blue
                    self.status = false
                    self.objectWillChange.send()
                    self.scanState = .pending
                    
                }
                
            }
            DispatchQueue.global(qos: .userInteractive).async {
                self.scanPassOnSystem()
            }
            
        }
    }
    
    init(scanningStop: String, operatorRouteId: String){
        self.scanningStopId = scanningStop
        self.operatorRouteId = operatorRouteId
    }
    
    
    func scanPassOnSystem(){
        Network.shared.apollo.perform(mutation: ScanPassMutation(passId: self.passId, operatorRouteId: self.operatorRouteId, scanningStopId: self.scanningStopId)) { result in
          defer {
            //self?.enableSubmitButton(true)
          }
            
            switch result {
            case .success(let graphQLResult):
                print("success")
                if let status = graphQLResult.data?.scanPass?.status{
                   
                    DispatchQueue.main.async {
                        
                        self.objectWillChange.send()
                        self.scanStateColor = status ? Color.green : Color.red
                        self.scanState = status ? .verified : .nonverified
                        self.status = true
                        
                    }
                  
                }
     
            case .failure(let error):
                print("Error: \(error)")
            }

        }
    
    }
    
    
}

enum PassScanState: String {
    case verified = "Pass Accepted" , pending = "Ready To Scan", nonverified = "Pass Not Accepted"
}
