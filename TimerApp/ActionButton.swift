//
//  StartButton.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import SwiftUI

struct ActionButton: View {
//    @Binding var userName: String
//    @Binding var isRegistered: Bool
//    @ObservedObject var timer: TimeCounter
    
    var titleBtn: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(titleBtn)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 300, height: 60) // если вынести наружу, то тап сработает только на тексте
        }
        .actionButtonAppearance(color) //свой модификатор
    }
    
    init(
        titleBtn: String,
        color: Color,
//        userName: Binding<String> = .constant(""), //необязательные параметры (значение по умолчанию)
//        isRegistered: Binding<Bool> = .constant(false),
        action: @escaping () -> Void
    ){
        self.titleBtn = titleBtn
        self.color = color
//        self._userName = userName
//        self._isRegistered = isRegistered
        self.action = action
    }
}

// MARK:  - Custom Modifier for button
struct ActionButtonModifier: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .background(color)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.orange, lineWidth: 2))
    }
}

extension View {
    func actionButtonAppearance(_ color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ActionButtonModifier(color: color)
        )
    }
}


// MARK:  - PreviewProvider
struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        //        StartButton(timer: TimeCounter())
        ActionButton(titleBtn: "Text", color: .blue, action: {})
    }
}
