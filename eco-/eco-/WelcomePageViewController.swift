//
//  WelcomePageViewController.swift
//  eco-
//
//  Created by Akoly Vongdala on 7/30/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIViewController {

    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayGreeting()
    }
    
    func displayGreeting() {
        let timeOfDay = getCurrentDateTime()
        
        // check what timeOfDay is
        if (timeOfDay == "PM"){
            // print good afternoon is PM
            greetingLabel.text = "Good aftermoon, Sidhika"
        }else{
            // print good morning if not
            greetingLabel.text = "Good morning, Sidhika"
        }
    }
    
    func getCurrentDateTime() -> String{
        // grab the current date/time
        let formatter = DateFormatter()
        //formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        // put the time/date into string
        let str = formatter.string(from: Date())
        
        let time = str.components(separatedBy: " ")
        
        let timeOfDay = time[1]
        
        return timeOfDay
    }
}
