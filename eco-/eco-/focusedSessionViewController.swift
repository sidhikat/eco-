//
//  focusedSessionViewController.swift
//  eco-
//
//  Created by Akoly Vongdala on 8/2/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData

class focusedSessionViewController: UIViewController {
    
    var container:NSPersistentContainer!
    var seconds = 30
    var timer = Timer() // same as NSTimer()
    let timeInterval:TimeInterval = 0.5
    let timeEnd:TimeInterval = 0.0
    var timeCount:TimeInterval = 2700.00 // = 45 minutes
    var fetchedTaskInformation : [TaskInformation] = []
    
    var messages: [String] = [
        "you are on your way to greatness!🏆",
        "you can do this!",
        "almost there! keep pushing 💪🏽"
        ]
    
    @IBOutlet weak var motivationMessage: UILabel!
    @IBOutlet weak var focusedSessionImg: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var giveUpBtn: UIButton!
    @IBOutlet weak var taskLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a reference to the appDelegate to be able to get all of its variables
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        //create a container for CoreData
        container = appDelegate.persistentContainer
        guard  container != nil else {
            fatalError("container is nil")
        }
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "TaskInformation")
        //create an array of UserInformation Entity for all tasks added
        self.fetchedTaskInformation = try! container.viewContext.fetch(itemsFetchRequest) as! [TaskInformation]
        
        for i in fetchedTaskInformation {
            timeCount = TimeInterval(i.durationMin)*60 + TimeInterval(i.durationHour)*3600
        }
        
        // calling the counter function
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(focusedSessionViewController.counter), userInfo: nil, repeats: true)
        
        // rounding the corners
        giveUpBtn.layer.cornerRadius = 5
        
        // displaying messages
        motivationMessage.text = messages[0]
        
        // calling the timeString func
        timerLabel.text = timeString(time: timeCount)
        
        taskLabel.text = "Task(s) to be completed during your focus session:"
        
        
        
        // strike through
//        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string:taskLabel.text!)
//        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
//        taskLabel.attributedText = attributeString
    }
    
    // count down and display messages
    @objc func counter() {
        timeCount -= 1
        timerLabel.text = timeString(time: timeCount)
        
        
        if (timeCount <= 2701){
            motivationMessage.text = messages[0]
        }else if (timeCount <= 2200){
            motivationMessage.text = messages[1]
        }else if (timeCount <= 1600){
            motivationMessage.text = messages[2]
        }

        // if the timeCount reaches 0
        if (timeCount == 0){
            // stop the timer
            timer.invalidate()
        }
    }
    
    // TimeString function
    func timeString(time:TimeInterval) -> String {
       // calculating var to be in secons
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    
    @IBAction func giveUpPressed(_ sender: Any) {
        let warning = UIAlertController(title: "Warning", message: "Are you sure you want to give up?", preferredStyle: .alert)
        
        let yesGiveUp = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler:
        { _ in
            //unwind to last controller when yes is clicked on alert
            self.navigationController?.popViewController(animated:true)
            self.dismiss(animated: true, completion: nil)
        })
        let noGiveUp = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
        
        warning.addAction(yesGiveUp)
        warning.addAction(noGiveUp)
        self.present(warning, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
