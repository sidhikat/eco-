//
//  PopUpVCViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/31/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var subtasksTableView: UITableView!
    
    var subtasks = ["subtask1", "subtask2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topView.layer.cornerRadius = 10
    }
    
    func tableView(_ subtasksTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subtasks.count
    }
    
    //return a cell and changes it's UI based on code
    func tableView(_ subtasksTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = subtasksTableView.dequeueReusableCell(withIdentifier: "subtaskCell", for: indexPath) as! SubtasksTableViewCell
        cell.subtaskLabel.text = subtasks[indexPath.row]
        
        //set a unique tag for each button
        //cell.checkBoxButton.tag = indexPath.row
        
        //listens to the button and goes to the function specified (btnclicked)
        //cell.checkBoxButton.addTarget(self, action:#selector(btnClicked), for:.touchUpInside)
        
        return cell
        
    }

}
