//
//  ViewController.swift
//  checkweight
//
//  Created by 池田光里 on 2021/08/27.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    
    @IBOutlet weak var MainLabel: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var chart: LineChartView!

    @IBOutlet weak var WeightInput: UITextField!
    var date: [String]!
    var weight: [Double]!
    override func viewDidLoad() {
        date = ["08/24","08/25","08/26","08/27"]
        weight = [50,60,50,60]
        btn.addTarget(self, action: #selector(inputData), for: .touchUpInside)
        chart.noDataText = "no data"
        setChart(data: date, values: weight)
        super.viewDidLoad()
    }
    func setChart(data:[String],values:[Double]){
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<data.count{
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Weight")
        chartDataSet.colors = [.systemBlue]
        let chartData = LineChartData(dataSet: chartDataSet)
        chart.data = chartData
    }
    @objc func inputData(){
        date.append("08/27")
        weight.append(Double(WeightInput.text!) ?? 0)
        
        setChart(data: date, values: weight)
    }

}

