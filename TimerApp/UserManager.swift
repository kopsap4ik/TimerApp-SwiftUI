//
//  UserManager.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import Combine
import UIKit

class UserManager: ObservableObject {
    @Published var isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
    var name = UserDefaults.standard.string(forKey: "Name") ?? ""
    
//    init() {}
    
//    init(name: String) {
//        self.name = name
//    }
}
