//
//  LoginView.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

struct LoginView: View {
    
    @State private var name = ""
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        
        if userManager.isRegistered {
            ContentView()
        } else {
            VStack {
                TextField("Введите логин", text: $name)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                
                Button(action: { registerUser() }) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("ВОЙТИ")
                    }
                }
            }
        }
        
        
    }
}

extension LoginView { 
    private func registerUser() {
        if name.isEmpty == false {
            userManager.name = name
            userManager.isRegistered = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
