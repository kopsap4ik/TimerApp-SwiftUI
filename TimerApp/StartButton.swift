//
//  StartButton.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

struct StartButton: View {
    
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text("\(timer.buttonTitle)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 300, height: 60) // иначе тап сработает только на тексте
        }
        .background(Color.red)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.orange, lineWidth: 2))
        
    }
    
}


struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(timer: TimeCounter())
    }
}
