//
//  LoginView.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        VStack {   
            HStack {
                VStack {
                    Image(systemName: (!userManager.nameIsValid ? "lock.fill" : "lock.open"))
                        .frame(width: 30.0)
                        .foregroundColor(!userManager.nameIsValid ? .red : .green)
                    
                    Text("\(userManager.user.name.count)")
                        .font(.caption)
                        .foregroundColor(!userManager.nameIsValid ? .red : .green)
                }
                
                TextField("Введите логин",
                          text: $userManager.user.name,
                          onCommit: { registerUser() }
                )
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(width: 300.0)
            .background(Capsule().stroke(Color(.lightGray)))
            
            Button(action: { registerUser() }) {
                Text("ВОЙТИ")
                    .bold()
            }
            .padding(.top, 10)
            .disabled(!userManager.nameIsValid)
        }
    }
}

extension LoginView { 
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered = true
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
