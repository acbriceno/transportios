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

        ZStack{
            
            if(authViewModel.isLoggedIn()){
                authViewModel.authorizedView
            }else{
            
            
            VStack{
//                    NavigationLink(
//                        destination: $authViewModel.authorizedView.wrappedValue,
//                        isActive: $authViewModel.isAuthenticated
//                        ){
//                        EmptyView()
//
//                    }
                
                            
                Text("Belize Transport")
                    .padding()
                    .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.width, height: 80)
                    .background(Color.blue)
                    .offset(y: -UIScreen.main.bounds.height/7)

                    VStack{
                        TextField(
                            "Email",
                            text: $email
                        )
                        .border(Color.blue)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        SecureField("Password", text: $password)
                            .border(Color.blue)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                       

                }.padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                

                Button("Log In", action: {
                    authViewModel.authenticate(email: email, password: password)
                })
            } //.navigationBarBackButtonHidden(true)
        }
       
 
        }
    
     
   
    }
}


