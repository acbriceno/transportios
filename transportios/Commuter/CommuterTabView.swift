//
//  CommuterTabView.swift
//  transportios
//
//  Created by grid on 2020-11-26.
//

import SwiftUI

struct CommuterTabView: View {
    @State var isLoggedIn = false
    var body : some View {
        ZStack{
            
            if !isLoggedIn{
                LoginView(authViewModel: AccountManager())
            }else{
        VStack{
        
        TabView {
            ScheduleTabView(searchParam: "")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedules")
                }
            Text("Passes")
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("Passes")
                }
            CommuterTabSettings(isLoggedIn: $isLoggedIn)
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
