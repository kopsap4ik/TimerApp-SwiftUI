//
//  StarterView.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Group{
            if userManager.isRegistered == true  { ContentView() }
            else { LoginView() }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
