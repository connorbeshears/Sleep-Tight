//
//  ResponseViewController.swift
//  Sleep Tight
//
//  Created by Thompson,Kyle H on 4/3/18.
//  Copyright © 2018 Connor Beshears. All rights reserved.
//

import UIKit
import CoreData

class ResponseViewController: UIViewController {
    let sleepModel = AppDelegate.sleepModel
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func terribleBtn(_ sender: Any) {
        sleepModel.setFeel(x: 0)
    }
    
    @IBAction func poorlyBtn(_ sender: Any) {
        sleepModel.setFeel(x: 1)
    }
    
    @IBAction func okayBtn(_ sender: Any) {
        sleepModel.setFeel(x: 2)
    }
    
    @IBAction func goodBtn(_ sender: Any) {
        sleepModel.setFeel(x: 3)
    }
    
    @IBAction func greatBtn(_ sender: Any) {
        sleepModel.setFeel(x: 4)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//kill me
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     AppDelegate.sleepModel.setFeel(x:indexPath.row)
     let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     let sleepSubmit = NSEntityDescription.insertNewObject(forEntityName: "Time", into: moc) as! SleepTimeMO
     let sleepMinTmp:Int = AppDelegate.sleepModel.getMinutes()
     let sleepMin:Int16 = Int16(sleepMinTmp)
     sleepSubmit.timeInMinutes = sleepMin
     sleepSubmit.date = AppDelegate.sleepModel.displayDate()
     let feelIndex:Int = AppDelegate.sleepModel.feelNum
     let tmpFeelIndex:Int16 = Int16(feelIndex)
     sleepSubmit.feelingIndex = tmpFeelIndex
     do{
     try moc.save()
     print("Saved")
     } catch {
     print("Error: \(error)")
     }
     
     
    */

}
