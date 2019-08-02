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
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.subtasksView.layer.cornerRadius = 10 //gives popover rounded edges
        //expandButtonImageView.isUserInteractionEnabled = true
    }
    var tasks = [
        Task(taskName: "Get almond milk", hasSubtasks: false),
        Task(taskName: "Psych HW", hasSubtasks: true),
        Task(taskName: "Finish Xcode project", hasSubtasks: true)
        ]
 
    
    //returns the number of rows/elements in the tasks array
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if(tasks.count > 14){
        return tasks.count
//        }else{
//            return 14
//        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //return a cell and changes it's UI based on code
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
//        cell.focusButton.isHidden = true
//        cell.checkBoxButton.isHidden = true
//        if(indexPath.row < tasks.count){
        cell.taskNameLabel.text = tasks[indexPath.row].taskName
//            cell.focusButton.isHidden = false
//            cell.checkBoxButton.isHidden = false
        //set a unique tag for each button
        cell.checkBoxButton.tag = indexPath.row
        
        //listens to the button and goes to the function specified (btnclicked)
        cell.checkBoxButton.addTarget(self, action:#selector(btnClicked), for:.touchUpInside)
        //}
        
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
        //tableView.deselectRow(at: indexPath, animated: true)

        performSegue(withIdentifier: "toPopUp", sender: cell)
        
    }
    
    //TODO: create strikethrough when clicked on button
    @IBAction func btnClicked(_ sender: UIButton) {
        //get sender's parent cells and cast it as a subtasktableviewcell
        let cell = sender.superview
        let cell2 = cell?.superview as! TaskTableViewCell
        
        //create the subtaskLabel's text as attributed string so it can be mutated
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cell2.taskNameLabel.text!)
        
        //changes attributes depending on current state
        if(sender.imageView?.image == UIImage(named: "emptyCheckbox")){
            //change image to completedCheckbox
            sender.setImage(UIImage(named: "completedCheckbox"), for: .normal)
            //add strikethrough attribute to string
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell2.taskNameLabel.attributedText = attributeString
        }else{
            //change image to empty if clicked again
            sender.setImage(UIImage(named: "emptyCheckbox"), for: .normal)
            //remove strikethrough attributes
            attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
            cell2.taskNameLabel.attributedText = attributeString
        }
        
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        //TODO: perform segue to add task screen
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

