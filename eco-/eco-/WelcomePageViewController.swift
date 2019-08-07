//
//  WelcomePageViewController.swift
//  eco-
//
//  Created by Akoly Vongdala on 7/30/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData
//import Lottie

class WelcomePageViewController: UIViewController {

    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var btnTodo: UIButton!
    @IBOutlet weak var btnFocus: UIButton!
    @IBOutlet weak var btnSummary: UIButton!
    var container:NSPersistentContainer!
    var userName: String = "Shannon"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayGreeting()
        
        // rounding the button edges
        btnTodo.layer.cornerRadius = 5
        btnFocus.layer.cornerRadius = 5
        btnSummary.layer.cornerRadius = 5
        
        // assigning the button name
        btnTodo.setTitle("To-do list", for: .normal)
        btnSummary.setTitle("Summary", for: .normal)
        btnFocus.setTitle("Focused session", for: .normal)
    }
    
    func displayGreeting() {
        
//        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "UserInformation")
//
//        let fetchedUser = try! container.viewContext.fetch(itemsFetchRequest) as! [UserInformation]
//
//        for i in fetchedUser {
//            userName = i.firstName!
//        }
        
        
        // grabing the user's time informaition
        let timeOfDay = getCurrentDateTime()
        
        // check what timeOfDay is
        if (timeOfDay == "PM"){
            // print good afternoon is PM
            greetingLabel.text = "Good afternoon, " + userName + " 🌤"
            
            //let str : String = "Smiley \u{1F603}"
        }else{
            // print good morning if not
            greetingLabel.text = "Good morning, " + userName + " ☀️"
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
