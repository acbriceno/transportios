//
//  AccountManager.swift
//  transportios
//
//  Created by grid on 2020-11-22.
//

import Foundation
import SwiftUI
class AccountManager: ObservableObject{
    let userAccount = UserDefaults.standard
    @Published  var isAuthenticated: Bool = false
    private var authorizedViews: [String: AnyView]  = ["OPERATOR": AnyView(OperatorPassScanerView()), "COMMUTER" : AnyView(ContentView()), "": AnyView(ContentView())]
    @Published var authorizedView: AnyView = AnyView(ContentView())
    //MARK: Intent(s)
    
    func authenticate(email: String, password: String){
      
        Network.shared.apollo.perform(mutation: BaseLoginMutation(email: email, password: password)) { result in
          defer {
            //self?.enableSubmitButton(true)
          }
            
            switch result {
            case .success(let graphQLResult):
                print("success")
              
               
                    
                if let token = graphQLResult.data?.baseLogin?.token {
                    print(token)
                    let fullName = (graphQLResult.data?.baseLogin?.user!.firstName)! + " " + (graphQLResult.data?.baseLogin?.user!.lastName)!
                    self.saveSession(with: token, name: fullName, role: (graphQLResult.data?.baseLogin?.user!.role.role)!.rawValue)
                    self.authorizedView = self.getRole()
                    self.isAuthenticated = true
                    
                }
                
               
                
            case .failure(let error):
                print("Error: \(error)")
            }

        }
    
    }
    
    func getRole() -> AnyView {
        if let role = userAccount.string(forKey: "role"){
            return authorizedViews[role]!
        }
        return authorizedViews[""]!
    }
    
    //MARK: Util(s)
    private func saveSession(with token: String,  name: String, role: String){
      
        userAccount.set(token, forKey:"sessionToken")
        userAccount.set(name, forKey:"name")
        userAccount.set(role, forKey:"role")
        userAccount.synchronize()
    }
    

}
