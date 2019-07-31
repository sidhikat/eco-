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
    
    @IBOutlet weak var durationTimePicker: UIDatePicker!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    @IBOutlet weak var subtaskTableView: UITableView!
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
    }
    
}


