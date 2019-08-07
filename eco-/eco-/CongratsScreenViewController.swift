//
//  CongratsScreenViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/29/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData

class CongratsScreenViewController: UIViewController {
    
    var container:NSPersistentContainer!
    
    var fetchedTask : [TaskInformation] = []
    
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var summaryButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        container = appDelegate.persistentContainer

        // Do any additional setup after loading the view.
        congratsLabel.font = UIFont(name: "Farah", size: 50)
        
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "TaskInformation")
        
        self.fetchedTask = try! container.viewContext.fetch(itemsFetchRequest) as! [TaskInformation]
        for i in fetchedTask{
            timeLabel.text = "\(i.durationHour) hours and \(i.durationMin) min"
        }
        
    }
    
    
    

}
