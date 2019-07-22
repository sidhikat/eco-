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

    
    var tasks = [
        Task(taskName: "sample", taskStatus: false),
        Task(taskName: "second task", taskStatus: true)
        ]
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.taskNameLabel.text = tasks[indexPath.row].taskName
        
        return cell
    }
    

  


}

