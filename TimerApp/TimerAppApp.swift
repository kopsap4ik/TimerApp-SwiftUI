//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

@main
struct TimerAppApp: App {
    
    // загружаем пользователя в самом начале в одном месте на весь проект
    // если пользователя еще нет, то будут значения по умолчанию
    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
