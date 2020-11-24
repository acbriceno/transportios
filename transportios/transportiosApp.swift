//
//  transportiosApp.swift
//  transportios
//
//  Created by grid on 2020-11-21.
//

import SwiftUI

@main
struct transportiosApp: App {
    //let msg = QueryController()
    let am = AccountManager()

    var body: some Scene {
        //let _: () = am.authenticate(email: "as", password: "asd")
        WindowGroup {
            LoginView(authViewModel: am)
            //ContentView()
            //ScannerTestView()
        }
    }
}
