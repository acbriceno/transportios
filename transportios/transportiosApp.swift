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
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                      
            //ContentView()
            //ScannerTestView()
            //NavManagerView()
           // ScheduleTabView(searchParam: "")
        }
    }
}


extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false // set to `false` if you don't want to detect tap during other gestures
    }
}
