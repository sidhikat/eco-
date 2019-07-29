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
    
    //returns the number of rows/elements in the tasks array
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    //return a cell and changes it's UI based on code
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.taskNameLabel.text = tasks[indexPath.row].taskName
        
        //set a unique tag for each button
        //cell.checkBoxButton.tag = indexPath.row
        
        //listens to the button and goes to the function specified (btnclicked)
        cell.checkBoxButton.addTarget(self, action:#selector(btnClicked), for:.touchUpInside)
        
        return cell
    }
    

    @IBAction func btnClicked(_ sender: UIButton) {
        //sets image of new button as completedCheckbox
        sender.setImage(UIImage(named: "completedCheckbox"), for: .normal)
    }



}

