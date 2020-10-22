//
//  TimeCounter.swift
//  TimerApp
//
//  Created by Василий Петухов on 22.10.2020.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "START"
    
     func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true)
        }
        buttonWait()
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        buttonTitle = "RESET"
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else { stopTimer() }
        objectWillChange.send(self) // после изменений счетчика отправляем объект самого класса подписчикам
    }
    
    private func buttonWait(){
        if buttonTitle == "RESET"{
            counter = 3
            buttonTitle = "START"
        } else { buttonTitle = "Wait..." }
        objectWillChange.send(self)
    }
    
}
