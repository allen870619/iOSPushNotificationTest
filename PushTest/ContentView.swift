//
//  ContentView.swift
//  PushTest
//
//  Created by Lee Yen Lin on 2022/1/28.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresenting = false
    @State private var passed = false
    @State private var text = ""
    
    var body: some View {
        VStack{
            Text("Back to desktop and\n drag apns to simulator!")
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 48)
                .accessibilityLabel("status")
            
            Button("Auth"){
                // auth Push
                let center = UNUserNotificationCenter.current()
                center.requestAuthorization(options: [.alert, .sound]) { granted, error in
                    isPresenting = true
                    passed = granted
                    text = granted ? "Pass!" : "Failed!\nPlease open notification!"
                }
            }.frame(width: 120, height: 36, alignment: .center)
                .font(.system(size: 32))
                .alert(text, isPresented: $isPresenting) {
                    if passed{
                        Button("OK", role: .cancel) { }
                    }else{
                        Button("FAILED", role: .cancel) { }
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
