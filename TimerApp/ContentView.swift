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
        VStack {
            Text("\(userManager.name )")
                .font(.largeTitle)
                .padding()
                .offset(x: 0, y: -200.0)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding()
                .offset(x: 0, y: -200.0)


            StartButton(timer: timer)
            
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
