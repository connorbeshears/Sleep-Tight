//
//  SleepTimerModel.swift
//  Sleep Tight
//
//  Created by Connor Beshears on 2/15/18.
//  Copyright © 2018 Connor Beshears and Kylo. All rights reserved.
//

import Foundation

class SleepTimerModel{

    var startTime:Date = Date()
    var endTime:Date = Date()
    var diffTime:TimeInterval = TimeInterval()
    let form:DateFormatter
    
    let feelings:[String]     //For displaying options
    var feelNum:Int                                     //To store feeling selected
    
    
    init()
    {
        self.startTime = Date()
        self.endTime = Date()
        self.diffTime = TimeInterval()
        self.form = DateFormatter()
        self.feelings = ["Terrible","Poorly","Okay","Good","Great"]
        self.feelNum = 0
    }
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
    func setFeel(x: Int){
        feelNum = x
    }
    
    
}
