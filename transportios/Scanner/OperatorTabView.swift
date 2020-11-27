//
//  OperatorTabView.swift
//  transportios
//
//  Created by grid on 2020-11-27.
//

import SwiftUI

struct OperatorTabView: View {
    @State var isLoggedIn = false
    var body : some View {
        
        ZStack{
            
            if !isLoggedIn{
                LoginView(authViewModel: AccountManager())
            }else{
            
            
        VStack{
        TabView {
            OperatorPassScanerView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Pass Scanner")
                }
            Text("Scanned Passes")
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Passes")
                }
            
            OperatorTabSettings(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .font(.headline)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        
        }
    }
    }
}
}
