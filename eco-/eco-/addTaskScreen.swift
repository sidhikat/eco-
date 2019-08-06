//
//  addTaskScreen.swift
//  eco-
//
//  Created by Guilherme de Brito Hohenfeld on 7/29/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData


class addTaskScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var duration = [["0", "1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11","12","13","14","15","16","17", "18", "19", "20", "21","22", "23"],
    ["hrs"],
                    ["0", "1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11","12","13","14","15","16","17", "18", "19", "20", "21","22", "23","24","25","26","27","28", "29","30", "31","32", "33", "34", "35", "36", "37", "38", "39", "40", "41","42", "43", "44", "45", "46", "47", "48", "49", "50", "51","52", "53", "54", "55", "56", "57", "58" , "59"],
        ["min"]
    ]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return duration.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return duration[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return duration[component][row]
    }
    
    var container: NSPersistentContainer!
    
    @IBOutlet weak var addTaskLabel: UILabel!
    
    @IBOutlet weak var dueDateImageView: UIImageView!
    
    @IBOutlet weak var durationImageView: UIImageView!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var taskDurationPicker: UIPickerView!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    
    //TextField
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var subTask1TextField: UITextField!
    @IBOutlet weak var subTask2TextField: UITextField!
    @IBOutlet weak var subTask3NameTextField: UITextField!
    @IBOutlet weak var subTask4TextField: UITextField!
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            var appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            container = appDelegate.persistentContainer
        }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        var taskName = taskNameTextField.text
        var subTask1Name = subTask1TextField.text
        var subTask2Name = subTask2TextField.text
        var subTask3Name = subTask3NameTextField.text
        var subTask4Name = subTask4TextField.text
        var taskDueDate = dueDatePicker.date
        var taskHour = duration[2][taskDurationPicker.selectedRow(inComponent: 2)]
        //print("HOURS SELECTED: \(taskHour)")
        var taskMin = duration[0][taskDurationPicker.selectedRow(inComponent: 0)]
        print ("Duration of task: \(taskHour) Hours and \(taskMin) min")
        let taskInformation = NSEntityDescription.insertNewObject(forEntityName: "TaskInformation", into: container.viewContext) as! TaskInformation
        
        
        if let temp_taskName = taskNameTextField.text{
            var taskName = temp_taskName
            taskInformation.taskName = taskName
        }
        
       if let temp_subTask1Name = subTask1TextField.text{
            var subTask1Name = temp_subTask1Name
            taskInformation.subTask1Name = subTask1Name
        }
        
        if let temp_subTask2Name = subTask2TextField.text{
            var subTask2Name = temp_subTask2Name
            taskInformation.subTask2Name = subTask2Name
        }
        
        if let temp_subTask3Name = subTask3NameTextField.text{
            var subTask3Name = temp_subTask3Name
            taskInformation.subTask3Name = subTask3Name
        }
        
        if let temp_subTask4Name = subTask4TextField.text{
            var subTask4Name = temp_subTask4Name
            taskInformation.subTask4Name = subTask4Name
        }
        
        if let temp_dueDate = dueDatePicker?.date {
            var taskDueDate = temp_dueDate
            taskInformation.dueDate = taskDueDate
        }
        
        var taskHourInt = Int16(taskHour)
        var taskMinInt = Int16(taskMin)
        
        taskInformation.durationMin = taskHourInt!
        taskInformation.durationHour = taskMinInt!
        
        
        try! container.viewContext.save()
        
        print (taskInformation)
        self.performSegue(withIdentifier: "addTaskSeg", sender: sender
        )
        
    }
    
}


