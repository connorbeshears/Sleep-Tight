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
    
    @IBAction func popTest(_ sender: Any) {
//        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let sleepSubmit1 = NSEntityDescription.insertNewObject(forEntityName: "Time", into: moc) as! SleepTimeMO
        
        for i in 11 ... 17{
            let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let sleepSubmit1 = NSEntityDescription.insertNewObject(forEntityName: "Time", into: moc) as! SleepTimeMO
            sleepSubmit1.date = "April \(i), 2018"
            sleepSubmit1.feelingIndex = Int16(arc4random_uniform(6))
            sleepSubmit1.timeInMinutes = Double(arc4random_uniform(4) + 4)
            
            do{
                try moc.save()
                print("Saved")
            } catch {
                print("Error: \(error)")
            }
        }
    
    }
    
    //Chart view code
    @IBOutlet weak var chartController: CombinedChartView!
    func setChart(data:[SleepTimeMO]){
        chartController.noDataText = "No data available"
        
        var dataBarEntries:[BarChartDataEntry] = []
        var dataLineEntries:[ChartDataEntry] = []
        var dates:[String] = []
        
        for i in 0 ..< data.count{
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(data[i].timeInMinutes))
            let lineEntry = ChartDataEntry(x: Double(i), y: Double(data[i].feelingIndex))
            dataBarEntries.append(dataEntry)
            dataLineEntries.append(lineEntry)
            dates.append(data[i].date!)
        }
        
        
        let barChartDataSet = BarChartDataSet(values: dataBarEntries, label: "Hours")
        barChartDataSet.valueTextColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        barChartDataSet.axisDependency = .left
        barChartDataSet.colors = [UIColor(red: 51.0/255.0, green: 153.0/255.0, blue: 102.0/255.0, alpha: 1.0)]
        
        
        
        let lineChartDataSet = LineChartDataSet(values: dataLineEntries, label: "Feeling")
        lineChartDataSet.colors = [UIColor(red: 168.0/255.0, green: 0.0/255.0, blue: 164.0/255.0, alpha: 1.0)]
        lineChartDataSet.circleColors = [UIColor(red: 168.0/255.0, green: 0.0/255.0, blue: 164.0/255.0, alpha: 1.0)]
        lineChartDataSet.valueTextColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        lineChartDataSet.axisDependency = .right
        lineChartDataSet.drawValuesEnabled = false
        
        
        let barChart = BarChartData(dataSet: barChartDataSet)
        let lineChart = LineChartData(dataSet: lineChartDataSet)
        
        let tmpComb:[IChartDataSet] = [barChartDataSet, lineChartDataSet]
        let comDataSet = CombinedChartData(dataSets: tmpComb)
        comDataSet.barData = barChart
        comDataSet.lineData = lineChart
        chartController.xAxis.valueFormatter = IndexAxisValueFormatter(values: dates)
        chartController.xAxis.granularity = 1
        chartController.xAxis.labelRotationAngle = 45
        chartController.xAxis.labelTextColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        chartController.leftAxis.labelTextColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        chartController.rightAxis.drawLabelsEnabled = false
        chartController.rightAxis.drawGridLinesEnabled = false
        chartController.leftAxis.drawGridLinesEnabled = false
        
        chartController.leftAxis.axisMinimum = 0.0
        chartController.rightAxis.axisMinimum = 0.0
        chartController.xAxis.drawLabelsEnabled = true
        chartController.chartDescription?.text = ""
        chartController.xAxis.axisMinimum = -0.5
        chartController.xAxis.axisMaximum = Double(data.count) - 0.5
        
        chartController.data = comDataSet
        
    }
    
    
}

