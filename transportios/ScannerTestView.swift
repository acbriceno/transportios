//
//  ScannerTestView.swift
//  transportios
//
//  Created by grid on 2020-11-24.
//

import SwiftUI
import CarBode
import AVFoundation //import to access barcode types you want to scan

struct ScannerTestView: View {

    var body: some View {
        VStack{

        CBScanner(
                supportBarcode: .constant([.qr]), //Set type of barcode you want to scan
                scanInterval: .constant(5.0) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
            }

    }
}
}
