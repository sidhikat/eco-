//
//  newSummaryViewController.swift
//  eco-
//
//  Created by Joseph Duodu on 7/28/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class newSummaryViewController: UIViewController {
    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var firstLabelView: UIView!
    @IBOutlet weak var secondLabelView: UIView!
    @IBOutlet weak var thirdLabelView: UIView!
    @IBOutlet weak var fourthLabelView: UIView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    var sampleViews: [UIView] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sampleViews.append(graphView)
        sampleViews.append(firstLabelView)
        sampleViews.append(secondLabelView)
        sampleViews.append(thirdLabelView)
        sampleViews.append(fourthLabelView)
        
        renderCustomization(input: sampleViews)
        firstButton.setImage(UIImage(named: "cash")?.withRenderingMode(.alwaysOriginal), for: .normal)
        secondButton.setImage(UIImage(named: "alarm-clock")?.withRenderingMode(.alwaysOriginal), for: .normal)
        thirdButton.setImage(UIImage(named: "completed-task")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    
    func renderCustomization(input: [UIView]) {
        for num in 0...(input.count - 1) {
            input[num].layer.cornerRadius = 10
            /*input[num].layer.shadowOpacity = 5
            input[num].layer.shadowRadius = 5
            input[num].layer.shadowColor = UIColor(named: "Orange")?.cgColor
            input[num].layer.shadowOffset = CGSize(width: 3, height: 3) */
 
            //input[num].backgroundColor = UIColor(red: 1.0, green: 0.784, blue: 0.2, alpha: 1.0)
            
            //input[num].backgroundColor = UIColor.lightGray
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
