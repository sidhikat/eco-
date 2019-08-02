//
//  addTaskScreen.swift
//  eco-
//
//  Created by Guilherme de Brito Hohenfeld on 7/29/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData


class addTaskScreen: UIViewController {
    var container:NSPersistentContainer!
    
    @IBOutlet weak var addTaskLabel: UILabel!
    
    @IBOutlet weak var dueDateImageView: UIImageView!
    
    @IBOutlet weak var durationImageView: UIImageView!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
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
        //var taskName = taskNameTextField.text
        var subTask1Name = subTask1TextField.text
        var subTask2Name = subTask2TextField.text
        var subTask3Name = subTask3NameTextField.text
        var subTask4Name = subTask4TextField.text
        
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
        
        try! container.viewContext.save()
        
        print (taskInformation)
        
        
        
        
        
        
    }
    
}


