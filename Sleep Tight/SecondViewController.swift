//
//  SecondViewController.swift
//  Sleep Tight
//
//  Created by Connor Beshears on 2/13/18.
//  Copyright © 2018 Connor Beshears. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func printData(_ sender: Any) {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<SleepTimeMO> = NSFetchRequest(entityName: "Time")
        do{
            let fetchAll = try moc.fetch(fetchRequest)
            for ob in fetchAll{
                print("Date: \(ob.date!) \nTime in Minutes \(ob.timeInMinutes)\nFeeling: \(AppDelegate.sleepModel.getFeel(index: Int(ob.feelingIndex)))")
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<SleepTimeMO> = NSFetchRequest(entityName: "Time")
        do{
            let getAll = try moc.fetch(fetchRequest)
            for ob in getAll{
                moc.delete(ob)
            }
            try moc.save()
        } catch{
            print("Error \(error)")
        }
        
    }
}

