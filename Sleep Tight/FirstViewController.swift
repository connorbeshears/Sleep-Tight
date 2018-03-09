//
//  FirstViewController.swift
//  Sleep Tight
//
//  Created by Connor Beshears on 2/13/18.
//  Copyright © 2018 Connor Beshears. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let sleepCont = SleepTimerModel()
    override func viewDidLoad() {
        roundedBTN.layer.cornerRadius = 25
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var roundedBTN: UIButton!
    @IBOutlet weak var statusLBL: UILabel!
    @IBOutlet weak var timeLBL: UILabel!
    @IBOutlet weak var endLBL: UILabel!
    @IBOutlet weak var diffLBL: UILabel!
    
    var hasStarted = false
    @IBAction func submitTime(_ sender: UIButton) {
        let form = DateFormatter()
        form.dateStyle = .none
        form.timeStyle = .short
        if(!hasStarted){
            (sender as AnyObject).setTitle("Stop", for: .normal)
            sender.backgroundColor = UIColor.red
            statusLBL.text = "Time has started"
            sleepCont.timerStart()
            timeLBL.text = sleepCont.displayStart()
            hasStarted = true;
        }
        else{
            (sender as AnyObject).setTitle("Start", for: .normal)
            sender.backgroundColor = UIColor.green
            statusLBL.text = "Time has ended"
            sleepCont.timerEnd()
            endLBL.text = sleepCont.displayEnd()
            var diffTime = sleepCont.calcDiff()
            diffLBL.text = sleepCont.convertToString()
            hasStarted = false;
        }
    }
}

