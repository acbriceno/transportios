//
//  LoginView.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import SwiftUI

struct LoginView: View{
   @ObservedObject var authViewModel: AccountManager
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var action = false
   


    var body: some View {

        NavigationView{
            VStack{
                HStack{
                    NavigationLink(
                        destination: $authViewModel.authorizedView.wrappedValue,
                        isActive: $authViewModel.isAuthenticated
                        ){
                        EmptyView()

                    }
                }
                            
                Text("")
                HStack{
                    VStack{
                        Text("Email")
                        Text("Password")
                       
                    }
                    VStack{
                        TextField(
                            "",
                            text: $email
                        )
                        .border(Color.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        
                        SecureField("", text: $password)
                            .border(Color.black)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                       
                    }

                }.padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                

                Button("Log In", action: {
                    authViewModel.authenticate(email: email, password: password)
                })
            }
        }
     
   
    }
}


