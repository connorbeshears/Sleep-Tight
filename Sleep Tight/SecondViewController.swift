//
//  SecondViewController.swift
//  Sleep Tight
//
//  Created by Connor Beshears on 2/13/18.
//  Copyright © 2018 Connor Beshears. All rights reserved.
//

import UIKit
import CoreData
import Charts
class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //grab data from core data
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchReq:NSFetchRequest<SleepTimeMO> = NSFetchRequest(entityName: "Time")
        var sleepArr:[SleepTimeMO] = []
        do{
            let allData = try moc.fetch(fetchReq)
            for x in allData{
                sleepArr.append(x)
            }
            
        } catch {
            print("Error \(error)")
        }
        
        //set up the chart
        chartController.clear()
        setChart(data:sleepArr)
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
                print("Date: \(ob.date) \nTime in Minutes \(ob.timeInMinutes)\nFeeling: \(AppDelegate.sleepModel.getFeel(index: Int(ob.feelingIndex)))")
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
    
    
    //Chart view code
    @IBOutlet weak var chartController: BarChartView!
    func setChart(data:[SleepTimeMO]){
        chartController.noDataText = "No data available"
        
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0 ..< data.count{
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(data[i].timeInMinutes))
            dataEntries.append(dataEntry)
        }
        
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Minutes")
        chartDataSet.colors = [UIColor.red]
        let chartData = BarChartData(dataSet: chartDataSet)
        chartController.data = chartData
        
        
    }
    
    
}

