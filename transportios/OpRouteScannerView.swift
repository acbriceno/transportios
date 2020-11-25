//
//  OpRouteScannerView.swift
//  transportios
//
//  Created by grid on 2020-11-25.
//


import SwiftUI
import CarBode
import AVFoundation //import to access barcode types you want to scan

struct OpRouteScannerView: View {
    @ObservedObject var opRouteScannerVM: OpRouteScannerViewModel
   
    var body: some View {
        VStack{
            
            Text(opRouteScannerVM.scanState.rawValue)
                .padding()
                .font(.headline)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width - 10, height: 80)
                    .background(opRouteScannerVM.scanStateColor)
                .cornerRadius(20)
            
        CBScanner(
                supportBarcode: .constant([.qr]), //Set type of barcode you want to scan
            scanInterval: .constant(opRouteScannerVM.scanInterval) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
            if(!opRouteScannerVM.status){
                opRouteScannerVM.passId = $0.value
            }
                
            }
        onDraw: {
            if(!opRouteScannerVM.status){
                //print("Preview View Size = \($0.cameraPreviewView.bounds)")
               // print("Barcode Corners = \($0.corners)")
                
                //line width
                let lineWidth = 2

                //line color
                let lineColor = UIColor.red

                //Fill color with opacity
                //You also can use UIColor.clear if you don't want to draw fill color
    let fillColor = UIColor(red: 0, green: 0.2, blue: 0.8, alpha: 0.4)
                
                //Draw box
    $0.draw(lineWidth: CGFloat(lineWidth), lineColor: lineColor, fillColor: fillColor)
            }
 
        }

    }
}
}
