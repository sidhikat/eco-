//
//  newSummaryViewController.swift
//  eco-
//
//  Created by Joseph Duodu on 7/28/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit
import CoreData

class newSummaryViewController: UIViewController {
    @IBOutlet weak var firstLabelView: UIView!
    @IBOutlet weak var secondLabelView: UIView!
    @IBOutlet weak var thirdLabelView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    
    
    var sampleViews: [UIView] = []
    var container:NSPersistentContainer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sampleViews.append(firstLabelView)
        sampleViews.append(secondLabelView)
        sampleViews.append(thirdLabelView)
        
        let borderColor = colorWithHexString(hexString: "669851")
        
        renderCustomization(input: sampleViews, color: borderColor)
        
        userNameLabel.text = "User"
        moneyLabel.text = "0"
        timeLabel.text = "0"
        taskLabel.text = "0"
        
        view.addSubview(imageView)
        
        
        transformToCircularImage(imageView: imageView)
        retrieveUserNameIntoSummaryLabel(inputLabel: userNameLabel)

    }
    
    
    func transformToCircularImage(imageView: UIImageView){
        
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.clear
        
    }
    
    func retrieveUserNameIntoSummaryLabel(inputLabel: UILabel) {
        let itemsFetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInformation")
        let requestResults = try! container.viewContext.fetch(itemsFetchrequest) as! [UserInformation]
        print(requestResults.count)
       // let user = requestResults[0]
       //  inputLabel.text = user.username
    }
    
    
    func renderCustomization(input: [UIView],  color: UIColor) {
        for num in 0...(input.count - 1) {
            input[num].layer.cornerRadius = 25
            input[num].layer.borderWidth = 5.0
            input[num].layer.borderColor = color.cgColor
            //input[num].backgroundColor = UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            input[num].backgroundColor = UIColor.lightGray
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
    
    
    // Today's objectives
    

    // make a label that will display the users name. The label should be different for each user of the app.
    // I would want to fetch the name of the user from Hohen's core data model.
    
    // I would want to be able to retrieve other information such as the amount of money the user earns, the
    // amount of time the user has spent staying focused, and the number of tasks the user has completed.
    
    

}
