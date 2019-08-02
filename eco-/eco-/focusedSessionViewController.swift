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
    var timer = Timer()
    var messages: [String] = [
        "you are on your way to greatness!🏆",
        "you can do this!",
        "almost there! keep pushing 💪🏽"
        ]
    
    @IBOutlet weak var motivationMessage: UILabel!
    @IBOutlet weak var focusedSessionImg: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var giveUpBtn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(focusedSessionViewController.counter), userInfo: nil, repeats: true)
        
        motivationMessage.text = "you can do this!"
    }
    
    @objc func counter() {
        seconds -= 1
        timerLabel.text = String(seconds)
        
        if (seconds == 0){
            timer.invalidate()
        }
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
