//
//  DataManager.swift
//  TimerApp
//
//  Created by Василий Петухов on 26.10.2020.
//

// MARK:  - новый подход для работы с UserDefaults
import SwiftUI

final class DataManager {
    static let shared = DataManager()
    
    // указывается ключ для UserDefaults
    // используется Data(), так как в данном варианте работаем с данным типом
    @AppStorage ("User") private var userData = Data()
    
    private init (){}
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        self.userData = userData
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func deleteUser(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered = false
        UserDefaults.standard.removeObject(forKey: "User")
    }
    
}

// MARK:  - стандартный подход для работы с UserDefaults

//import Foundation
//
//final class DataManager {
//    static let shared = DataManager()
//
//
//
//    private let userDefaults = UserDefaults.standard
//    private let keyUserDefaults = "User"
//
//    private init (){}
//
//    func saveUser(user: User) {
//        guard let userData = try? JSONEncoder().encode(user) else { return }
//        userDefaults.setValue(userData, forKey: keyUserDefaults)
//    }
//
//    func loadUser() -> User {
//        guard let userData = userDefaults.data(forKey: keyUserDefaults) as Data? else { return User() }
//        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
//        return user
//    }
//
//    func deleteUser(userManager: UserManager) {
//        userManager.user.name = ""
//        userManager.user.isRegistered = false
//        userDefaults.removeObject(forKey: keyUserDefaults)
//    }
//
//}
