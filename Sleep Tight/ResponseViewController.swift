//
//  ResponseViewController.swift
//  Sleep Tight
//
//  Created by Thompson,Kyle H on 4/3/18.
//  Copyright © 2018 Connor Beshears. All rights reserved.
//

import UIKit
import CoreData

class ResponseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let sleepModel = AppDelegate.sleepModel
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sleepModel.feelings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sleepModel.feelings[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//kill me
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
