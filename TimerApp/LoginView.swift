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
    
    private var wrongName: Bool {
        if name.count > 2 { return false }
        else { return true }
    }

    var body: some View {
        VStack {   
            HStack {
                VStack {
                    Image(systemName: (wrongName ? "lock.fill" : "lock.open"))
                        .frame(width: 30.0)
                        .foregroundColor(wrongName ? .red : .green)
                    
                    Text("\(name.count)")
                        .font(.caption)
                        .foregroundColor(wrongName ? .red : .green)
                }
                
                TextField("Введите логин",
                          text: $name,
                          onCommit: { registerUser() }
                )
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .frame(width: 300.0)
            .background(Capsule().stroke(Color(UIColor.lightGray)))
            
            Button(action: { registerUser() }) {
                Text("ВОЙТИ")
                    .bold()
            }
            .padding(.top, 10)
            .disabled(wrongName)
        }
    }
}

extension LoginView { 
    private func registerUser() {
        if name.isEmpty == false {
            UserDefaults.standard.set(name, forKey: "Name")
            UserDefaults.standard.set(true, forKey: "isRegistered")
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
