//
//  DonationViewController.swift
//  eco-
//
//  Created by Akoly Vongdala on 7/22/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DonationViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var LogoImage: UIImageView!
    
    @IBOutlet weak var BeeButton: UIButton!
    @IBOutlet weak var TreeButton: UIButton!
    @IBOutlet weak var SeaButton: UIButton!
    
    @IBOutlet weak var btnBee: UIButton!
    @IBOutlet weak var beeLabelShow: UILabel!
    
    // Organization Category
    let orgCategory = [
        OrgCategory(id: 0, category: "Bees", description: "Save the BEES!", image: "bee"),
        OrgCategory(id: 1, category: "Trees", description: "Plant more TREES!", image:"tree"),
        OrgCategory(id: 2, category: "Seas", description: "Clean the SEAS!", image: "sea")
    ]
    
    // Organization
    let org = [
        organization(orgName: "The Honeybee Conservancy", orgMission: "The Honeybee Conservancy & Anthophilous is a 501c3 non-profit established in 2009 in response to the bee crisis. They engage in education, outreach, support research and build bee habitats. They are a Project of Social and Environmental Entrepreneurs."),
        organization(orgName: "One Tree Planted", orgMission: "One Tree Planted is an environmental charity, they are dedicated to making it easier for individuals and businesses to give back to the environment, fight climate change, protect biodiversity and help reforestation efforts around the world. All by planting trees!"),
        organization(orgName: "Oceana", orgMission: "Oceana is the largest organization in the world solely devoted to marine conservation. It was established in 2001 by The Pew Charitable Trusts. Since its founding, Oceana has achieved hundreds of concrete policy victories for marine life and habitats.")
    ]
    
    
    // Declaring header and subheader description
    let header: String = "Donation"
    let subHeader: String = "Choose which organization will benefit from your productivity! For every hour you spent completing your task, we will donate $1 to your chosen organization!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Displaying the header, subheadr, and image
        headerLabel.text = header
        subheaderLabel.text = subHeader
        BeeButton.layer.cornerRadius = 4
        TreeButton.layer.cornerRadius = 4
        SeaButton.layer.cornerRadius = 4
        btnBee.layer.cornerRadius = 4
        
        //BeeButton.setTitle("Button Title", forState: UIControl.State.Normal)
        BeeButton.setTitle(orgCategory[0].description,for: .normal)
        TreeButton.setTitle(orgCategory[1].description, for: .normal)
        SeaButton.setTitle(orgCategory[2].description, for: .normal)
        btnBee.setTitle(orgCategory[0].description, for: .normal)
    }
    
    // testing for the drop down
    var showDescription = false
    
    @IBAction func onClickShow(_ sender: Any) {
        showDescription = !showDescription
        
        self.btnBee.setTitle("Test", for: .normal)
        UIView.animate(withDuration: 0.3){
            self.beeLabelShow.isHidden = !self.showDescription
            self.btnBee.setImage(UIImage(named: !self.showDescription ? "dropdown" : "dropup"), for: .normal)
        }
    
    }
    
}
