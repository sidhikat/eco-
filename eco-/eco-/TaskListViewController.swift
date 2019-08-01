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
    
    var container:NSPersistentContainer!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popMeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.subtasksView.layer.cornerRadius = 10 //gives popover rounded edges
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
    //performs segue when cell is tapped
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        var alertView = UIAlertController(title: "Subtasks", message: "You clicked cell \n at index : \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
//        alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alertView, animated: true, completion: nil)
//        self.view.addSubview(subtasksView)
//        subtasksView.center = self.view.center
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "toPopUp", sender: cell)
        

    }
    //adds a footer with an add button
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
////        let footerView = UIView()
////        footerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height:
////            100)
////
////        let button = UIButton()
////        button.frame = CGRect(x: 20, y: 10, width: 300, height: 50)
////        button.setTitle("CustomButton", for: .normal)
////        button.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
////        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
////        footerView.addSubview(button)
////        return footerView
//    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        //sets image of new button as completedCheckbox
        sender.setImage(UIImage(named: "completedCheckbox"), for: .normal)
    }
//prepares the popover segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopUp" {
            let pvc: PopUpViewController = segue.destination as! PopUpViewController
            
            pvc.popoverPresentationController?.backgroundColor = UIColor.darkGray
            pvc.popoverPresentationController!.delegate = self
    
            let presentationViewController = pvc.popoverPresentationController
            presentationViewController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            presentationViewController?.delegate = self
            presentationViewController?.sourceView = self.view
            //anchors the popup in center of screen
            presentationViewController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
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

