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
            Spacer()
            
            Text("Привет, \(userManager.user.name)")
                .font(.largeTitle)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
            
            ActionButton(
                titleBtn: timer.buttonTitle,
                color: timer.buttonIsWait ? Color.gray : Color.red
            ){ timer.startTimer() }
            .disabled(timer.buttonIsWait)
            
            Spacer()
            
            ActionButton(titleBtn: "Выйти", color: .green) {
                DataManager.shared.deleteUser(userManager: userManager)
            }
        
            Spacer()
                .frame(height: 20.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
