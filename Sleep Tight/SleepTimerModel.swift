//
//  SleepTimerModel.swift
//  Sleep Tight
//
//  Created by Connor Beshears on 2/15/18.
//  Copyright © 2018 Connor Beshears. All rights reserved.
//

import Foundation

class SleepTimerModel{

    var startTime:Date = Date()
    var endTime:Date = Date()
    var diffTime:TimeInterval = TimeInterval()
    let form:DateFormatter = DateFormatter()

    func timerStart(){
        startTime = Date()
    }
    
    func timerEnd(){
        endTime = Date()
    }
    
    func displayStart() -> String{
        form.timeStyle = .medium
        form.dateStyle = .none
        return(form.string(from: startTime))
    }
    
    func displayEnd() -> String{
        form.timeStyle = .medium
        form.dateStyle = .none
        return(form.string(from: endTime))
    }
    
    func calcDiff(){
        diffTime = endTime.timeIntervalSince(startTime)
    }
    
    func displayDiff() -> String{
        return("\(diffTime)")
    }
    
    func convertToString() -> String{
        let tmp = Int(diffTime)
        
        let seconds = tmp % 60
        let minutes = (tmp / 60) % 60
        let hours = (tmp / 3600)
        
        return "\(hours):\(minutes):\(seconds)"
    }
    
}
