//
//  DonationViewController.swift
//  eco-
//
//  Created by Akoly Vongdala on 7/22/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import Foundation
import UIKit

class DonationViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var LogoImage: UIImageView!
    
    @IBOutlet weak var BeeButton: UIButton!
    @IBOutlet weak var TreeButton: UIButton!
    @IBOutlet weak var SeaButton: UIButton!
    
    // Organization Category
    let orgCategory = [
        OrgCategory(id: 0, category: "Bees", description: "Save the BEES!", image: "bee"),
        OrgCategory(id: 1, category: "Trees", description: "Plant more TREES!", image:"tree"),
        OrgCategory(id: 2, category: "Seas", description: "Clean the SEAS!", image: "sea")
    ]
    
    // Declaring header and subheader description
    let header: String = "Donation"
    let subHeader: String = "Choose which organization will benefit from your productivity!For every hour you spent completing your task, we will donate $1 to your chosen organization!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Displaying the header, subheadr, and image
        headerLabel.text = header
        subheaderLabel.text = subHeader
    }
    
    
    
    
}