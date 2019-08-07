//
//  ViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/19/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    //TODO: link duration label to coredata
    
    var container:NSPersistentContainer!
    var fetchedTasks : [TaskInformation] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //create a reference to the appDelegate to be able to get all of its variables
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        //create a container for CoreData
        container = appDelegate.persistentContainer
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "TaskInformation")
        //create an array of TaskInformation Entity for all tasks added
         self.fetchedTasks = try! container.viewContext.fetch(itemsFetchRequest) as! [TaskInformation]
        //code to delete all tasks from CoreData
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: itemsFetchRequest)
//        try! container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
   }
    
    //returns the number of rows/elements in the tasks array
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedTasks.count

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //return a cell and changes it's UI based on code
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //fetch the coreData info everytime you render the cell
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "TaskInformation")
       self.fetchedTasks = try! container.viewContext.fetch(itemsFetchRequest) as! [TaskInformation]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        //sets cell's label based on the appropriate task in fetchedTasks array
        if(fetchedTasks[indexPath.row].taskName != nil){
        cell.taskNameLabel.text = fetchedTasks[indexPath.row].taskName

        //set a unique tag for each button
        cell.checkBoxButton.tag = indexPath.row
        
        //listens to the button and goes to the function specified (btnclicked)
        cell.checkBoxButton.addTarget(self, action:#selector(btnClicked), for:.touchUpInside)
            
        let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd hh:mm" //yyyy
        
            cell.dueDateLabel.text = "Due: " + formatter.string(from:fetchedTasks[indexPath.row].dueDate!)
        }
        return cell
        
    }
    //performs segue when cell is tapped
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let cell = tableView.cellForRow(at: indexPath)
        //tableView.deselectRow(at: indexPath, animated: true)

        performSegue(withIdentifier: "toPopUp", sender: cell)
        
    }
    
    //create strikethrough when clicked on button
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
            var cell = sender as! UITableViewCell
            pvc.taskRowId = self.tableView.indexPath(for:cell)!
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

