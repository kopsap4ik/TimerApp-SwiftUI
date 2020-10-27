//
//  UserManager.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import Combine
import UIKit

final class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3 // минимум 3 символа в имени
    }
    
    init() {}

    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
