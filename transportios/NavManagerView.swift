//
//  NavManagerView.swift
//  transportios
//
//  Created by grid on 2020-11-25.
//

import SwiftUI

struct NavManagerView: View {
    @State private var login = true
    var body: some View {
      
        NavigationView{
            NavigationLink(
                destination: LoginView(authViewModel: AccountManager()),
                isActive: $login
                ){
                EmptyView()
            }

            
//            NavigationLink(
//                destination: CommuterTabView(),
//                isActive: $login
//                ){
//                EmptyView()
//            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
   

    }
}
