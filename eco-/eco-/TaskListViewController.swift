//hi 
//  ViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/19/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var subtasksTableView: UITableView!
    @IBOutlet var subtasksView: UIView!
    var container:NSPersistentContainer!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var popMeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subtasksView.layer.cornerRadius = 10 //gives popover rounded edges
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
        cell.checkBoxButton.addTarget(self, action:#selector(btnClicked), for:.touchUpInside)
        
        return cell
        }else{
            let cell = subtasksTableView.dequeueReusableCell(withIdentifier: "subtaskCell", for: indexPath) as! SubtasksTableViewCell
            cell.subtaskLabel.text = subtasks[indexPath.row]
            return cell
        }
        
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var alertView = UIAlertController(title: "Subtasks", message: "You clicked cell \n at index : \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
//        alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alertView, animated: true, completion: nil)
        self.view.addSubview(subtasksView)
        subtasksView.center = self.view.center

    }

    @IBAction func btnClicked(_ sender: UIButton) {
        //sets image of new button as completedCheckbox
        sender.setImage(UIImage(named: "completedCheckbox"), for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopUp" {
            let pvc: PopUpViewController = segue.destination as! PopUpViewController
            pvc.popoverPresentationController?.backgroundColor = UIColor.darkGray
            pvc.popoverPresentationController!.delegate = self
    
            let presentationViewController = pvc.popoverPresentationController
            presentationViewController?.permittedArrowDirections = .any
            presentationViewController?.delegate = self
            presentationViewController?.sourceView = popMeButton
            presentationViewController?.sourceRect = popMeButton.bounds
        }
    }
    
    func adaptivePresentationStyle(for controller:
        UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        return UINavigationController(rootViewController: controller.presentedViewController)
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
        print("Controller did dismiss popover.")
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        
        print("Controller should dismiss popover.")
        
        return true
    }


}

