//
//  ContentView.swift
//  transportios
//
//  Created by grid on 2020-11-21.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
      
        VStack{
            Text("Content")
            .padding()
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.width - 10, height: 100)
                .background(Color.blue)
            .cornerRadius(20)
        }
   

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
