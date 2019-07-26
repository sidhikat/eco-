//hi 
//  ViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/19/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit


class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //expandButtonImageView.isUserInteractionEnabled = true
    }
    
    var tasks = [
        Task(taskName: "sample", hasSubtasks: false),
        Task(taskName: "second task", hasSubtasks: true)
        ]
    var subtasks = ["subtask1", "subtask2"]
    
    //returns the number of rows/elements in the tasks array
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 100){
            return tasks.count
        }else{
            return subtasks.count
        }
    }
    
    //return a cell and changes it's UI based on code
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView.tag == 100){
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.taskNameLabel.text = tasks[indexPath.row].taskName
        
        //set a unique tag for each button
        //cell.checkBoxButton.tag = indexPath.row
        
        //listens to the button and goes to the function specified (btnclicked)
        cell.checkBoxButton.addTarget(self,action:#selector(btnClicked), for:.touchUpInside)
        
        return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "subtaskCell", for: indexPath) as! SubtaskTableViewCell
            cell.subtaskLabel.text = subtasks[indexPath.row]
            return cell
        }
        
    }
    

    @IBAction func btnClicked(_ sender: UIButton) {
        //sets image of new button as completedCheckbox
        sender.setImage(UIImage(named: "completedCheckbox"), for: .normal)
    }



}

