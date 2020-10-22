//
//  UserManager.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegistered = false
    var name = ""
    
    init() {}
    
//    init(name: String) {
//        self.name = name
//    }
}
