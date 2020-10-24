//
//  ContentView.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Привет, \(userManager.name)")
                .font(.largeTitle)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
            
            StartButton(timer: timer)

            Button(action: { logOut() }) {
                Text("Выйти")
            }
            
            Spacer()
                .frame(height: 20.0)
        }
    }
}

extension ContentView {
    private func logOut() {
        UserDefaults.standard.set(false, forKey: "isRegistered")
        UserDefaults.standard.set(String(""), forKey: "Name")
        userManager.name = ""
        userManager.isRegistered = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
