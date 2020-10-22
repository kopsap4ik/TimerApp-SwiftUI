//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

@main
struct TimerAppApp: App {
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager())
        }
    }
}
