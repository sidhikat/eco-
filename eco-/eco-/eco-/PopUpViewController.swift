//
//  PopUpVCViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/31/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData

class PopUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var subtasksTableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    
    var container:NSPersistentContainer!
    var fetchedTasks : [TaskInformation] = []
    var emptyDict: [TaskInformation: [String]] = [:]
    var taskRowId : IndexPath = IndexPath(row: 0, section: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topView.layer.cornerRadius = 10
        //create a reference to the appDelegate to be able to get all of its variables
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        //create a container for CoreData
        container = appDelegate.persistentContainer
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "TaskInformation")
        //create an array of TaskInformation Entity for all tasks added
        self.fetchedTasks = try! container.viewContext.fetch(itemsFetchRequest) as! [TaskInformation]
        
        durationLabel.text = "Duration:  \(fetchedTasks[taskRowId.row].durationHour):\(fetchedTasks[taskRowId.row].durationMin)  hrs"
        
    }
    
    func tableView(_ subtasksTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //return a cell and changes it's UI based on code
    func tableView(_ subtasksTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = subtasksTableView.dequeueReusableCell(withIdentifier: "subtaskCell", for: indexPath) as! SubtasksTableViewCell
        
        
        //sets cell's subtask labels based on the appropriate task from fetchedTasks array
        if(indexPath.row == 0){
           cell.subtaskLabel.text = fetchedTasks[taskRowId.row].subTask1Name
            if(cell.subtaskLabel.text == ""){
                cell.checkBoxButton.isHidden = true
            }
            
        }else if(indexPath.row == 1){
           cell.subtaskLabel.text = fetchedTasks[taskRowId.row].subTask2Name
            if(cell.subtaskLabel.text == ""){
                cell.checkBoxButton.isHidden = true
            }
    }else if(indexPath.row == 2){
            cell.subtaskLabel.text = fetchedTasks[taskRowId.row].subTask3Name
            if(cell.subtaskLabel.text == ""){
                cell.checkBoxButton.isHidden = true
            }
        }else{
            cell.subtaskLabel.text = fetchedTasks[taskRowId.row].subTask4Name
            if(cell.subtaskLabel.text == ""){
                cell.checkBoxButton.isHidden = true
            }
        }
        

        
        //set a unique tag for each button
        //cell.checkBoxButton.tag = indexPath.row
        
        //listens to the button and goes to the function specified (checkBoxBtnclicked)
        cell.checkBoxButton.addTarget(self, action:#selector(checkBoxBtnClicked), for:.touchUpInside)

        return cell
        
    }
    
    //changes atrributes of tablecell if button clicked
    @IBAction func checkBoxBtnClicked(_ sender: UIButton) {
        
        //get sender's parent cells and cast it as a subtasktableviewcell
        let cell = sender.superview
        let cell2 = cell?.superview as! SubtasksTableViewCell
        
        //create the subtaskLabel's text as attributed string so it can be mutated
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cell2.subtaskLabel.text!)
        
        //changes attributes depending on current state
        if(sender.imageView?.image == UIImage(named: "emptyCheckbox")){
            //change image to completedCheckbox
        sender.setImage(UIImage(named: "completedCheckbox"), for: .normal)
            //add strikethrough attribute to string
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        cell2.subtaskLabel.attributedText = attributeString
        }else{
            //change image to empty if clicked again
            sender.setImage(UIImage(named: "emptyCheckbox"), for: .normal)
            //remove strikethrough attributes
            attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
            cell2.subtaskLabel.attributedText = attributeString
        }
    }
    
    func tableView(_ subtasksTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    //        var alertView = UIAlertController(title: "Subtasks", message: "You clicked cell \n at index : \(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
    //        alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    //        self.present(alertView, animated: true, completion: nil)
    //        self.view.addSubview(subtasksView)
    //        subtasksView.center = self.view.center

    let cell = subtasksTableView.cellForRow(at: indexPath) as! SubtasksTableViewCell
        //deselects the row after it's clicked
    subtasksTableView.deselectRow(at: indexPath, animated: true)
        //let cell = tableView.cellForRow(at: IndexPath.init(index: sender.tag)) as! TaskTableViewCell
        
        
    }
    
}
