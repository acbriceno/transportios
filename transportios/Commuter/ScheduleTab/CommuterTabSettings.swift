//
//  CommuterTabSettings.swift
//  transportios
//
//  Created by grid on 2020-11-27.
//

import SwiftUI

struct CommuterTabSettings: View {
    @Binding var isLoggedIn: Bool
    var body: some View{
        Form{
            Button("Log out", action: {
                var auth = AccountManager()
                auth.logout()
                self.isLoggedIn = false

            })
        }
    }
}
