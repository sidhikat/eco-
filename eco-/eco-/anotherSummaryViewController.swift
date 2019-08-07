//
//  anotherSummaryViewController.swift
//  eco-
//
//  Created by Joseph Duodu on 8/2/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData



class anotherSummaryViewController: UIViewController {
    @IBOutlet weak var stackBackGroundView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var moneyView: UIView!
    
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var moneyEarnedfig: UILabel!
    
    @IBOutlet weak var timeFocusedfig: UILabel!
    @IBOutlet weak var tasksCompletedfig: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var streakLabel: UILabel!
    
    
    var sampleViews: [UIView] = []
    var container:NSPersistentContainer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleViews.append(moneyView)
        sampleViews.append(timeView)
        sampleViews.append(taskView)
        self.container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
        
        let backGroundColor = colorWithHexString(hexString: "F6C362")
        renderCustomizationForEachView(input: sampleViews, color: backGroundColor)
        renderCustomization(input: stackBackGroundView)
        transformToCircularImage(imageView: imageView)
        
        userNameLabel.text = "Hello Sidhika"
        moneyEarnedfig.text = "20"
        timeFocusedfig.text = "60"
        tasksCompletedfig.text = "14"
        streakLabel.text = "6"

        // Do any additional setup after loading the view.
        retrieveUserNameIntoSummaryLabel(inputLabel: userNameLabel)
    }
    
    
    func transformToCircularImage(imageView: UIImageView){
        
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.clear
        
    }
    
    func renderCustomization(input: UIView) {
        input.layer.cornerRadius = 10.0
        input.layer.borderWidth = 2.0
        input.layer.borderColor = UIColor.clear.cgColor
        //input.backgroundColor = color
        input.backgroundColor = UIColor.clear
    }
    
    func renderCustomizationForEachView(input: [UIView], color: UIColor){
        for num in 0..<input.count {
            input[num].backgroundColor = color
            input[num].layer.cornerRadius = 20.0
        }
    }
    
    func colorWithHexString(hexString: String, alpha:CGFloat = 1.0) -> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    func retrieveUserNameIntoSummaryLabel(inputLabel: UILabel) {
        let itemsFetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInformation")
        let requestResults = try! container.viewContext.fetch(itemsFetchrequest) as! [UserInformation]
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
        //unwind two times to go to the tasklist screen
       
    }
    

}
