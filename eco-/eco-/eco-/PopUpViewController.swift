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
    @IBOutlet weak var editButton: UIButton!

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
