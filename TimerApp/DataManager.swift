//
//  DataManager.swift
//  TimerApp
//
//  Created by Василий Петухов on 26.10.2020.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private init (){}
    
    private let userDefaults = UserDefaults.standard
    private let keyUserDefaults = "User"
    
    func saveUser(user: User) {
        guard let userData = try? JSONEncoder().encode(user) else { return }
        userDefaults.setValue(userData, forKey: keyUserDefaults)
    }
    
    func loadUser() -> User {
        guard let userData = userDefaults.data(forKey: keyUserDefaults) as Data? else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func deleteUser(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered = false
        userDefaults.removeObject(forKey: keyUserDefaults)
    }
    
}
