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
    
    @IBOutlet weak var TreeButton: UIButton!
    @IBOutlet weak var treeLabelShow: UILabel!
    
    @IBOutlet weak var SeaButton: UIButton!
    @IBOutlet weak var seaLabelShow: UILabel!
    
    @IBOutlet weak var btnBee: UIButton!
    @IBOutlet weak var beeLabelShow: UILabel!
    
    @IBOutlet weak var checkBee: UIImageView!
    @IBOutlet weak var checkTree: UIImageView!
    @IBOutlet weak var checkSea: UIImageView!
    
    
    
    // Organization Category that includes images of each category
    let orgCategory = [
        OrgCategory(id: 0, category: "Bees", description: "Save the BEES!", image: "bee"),
        OrgCategory(id: 1, category: "Trees", description: "Plant more TREES!", image:"tree"),
        OrgCategory(id: 2, category: "Seas", description: "Clean the SEAS!", image: "sea")
    ]
    
    // Organization array that includes 3 specific organization that users can donate to
    let org = [
        organization(orgName: "The Honeybee Conservancy", orgMission: "The Honeybee Conservancy & Anthophilous is a 501c3 non-profit established in 2009 in response to the bee crisis. They engage in education, outreach, support research and build bee habitats. They are a Project of Social and Environmental Entrepreneurs."),
        organization(orgName: "One Tree Planted", orgMission: "One Tree Planted is an environmental charity, they are dedicated to making it easier for individuals and businesses to give back to the environment, fight climate change, protect biodiversity and help reforestation efforts around the world. All by planting trees!"),
        organization(orgName: "Oceana", orgMission: "Oceana is the largest organization in the world solely devoted to marine conservation. It was established in 2001 by The Pew Charitable Trusts. Since its founding, Oceana has achieved hundreds of concrete policy victories for marine life and habitats.")
    ]
    
    // Declaring header and subheader description
    let header: String = "Donation"
    let subHeader: String = "Select which organization will benefit from your productivity! For every hour you spend completing your task, we will donate $1 to your chosen organization!"
    
    // 
    override func viewDidLoad() {
        super.viewDidLoad()
        beeLabelShow.isHidden = true
        treeLabelShow.isHidden = true
        seaLabelShow.isHidden = true
        
        checkBee.isHidden = true
        checkTree.isHidden = true
        checkSea.isHidden = true
        
        // Displaying the header, subheadr, and image
        headerLabel.text = header
        subheaderLabel.text = subHeader
        
        // Rounding the buttons
        TreeButton.layer.cornerRadius = 5
        SeaButton.layer.cornerRadius = 5
        btnBee.layer.cornerRadius = 5
        
        //BeeButton.setTitle("Button Title", forState: UIControl.State.Normal)
        TreeButton.setTitle(orgCategory[1].description, for: .normal)
        SeaButton.setTitle(orgCategory[2].description, for: .normal)
        btnBee.setTitle(orgCategory[0].description, for: .normal)
    }
    
    // drop down for bees button
    var showDescription = false

    @IBAction func onClickShow(_ sender: Any) {
        showDescription = !showDescription
        
        self.btnBee.setTitle(org[0].orgName, for: .normal)
        UIView.animate(withDuration: 0.3){
            self.beeLabelShow.isHidden = !self.showDescription
            self.checkBee.isHidden = !self.showDescription
            self.btnBee.setImage(UIImage(named: !self.showDescription ? "dropdown" : "dropup"), for: .normal)
            self.beeLabelShow.text = self.org[0].orgMission
        }
    }
    
    // drop down for tree button
    var showDescriptionTree = false
    
    @IBAction func onClickTreeButton(_ sender: Any) {
        showDescriptionTree = !showDescriptionTree
        
        self.TreeButton.setTitle(org[1].orgName, for: .normal)
        UIView.animate(withDuration: 0.3){
            self.treeLabelShow.isHidden = !self.showDescriptionTree
            self.checkTree.isHidden = !self.showDescriptionTree
            //self.TreeButton.setImage(UIImage(named: !self.showDescriptionTree ? "dropdown" : "dropup"), for: .normal)
            self.treeLabelShow.text = self.org[1].orgMission
        }
    }
    
    // drop down for sea button
    var showDescriptionSea = false
    
    @IBAction func onClickSeaButton(_ sender: Any) {
        showDescriptionSea = !showDescriptionSea
        
        self.SeaButton.setTitle(org[2].orgName, for: .normal)
        UIView.animate(withDuration: 0.3){
            self.seaLabelShow.isHidden = !self.showDescriptionSea
            self.checkSea.isHidden = !self.showDescriptionSea
            //self.TreeButton.setImage(UIImage(named: !self.showDescriptionTree ? "dropdown" : "dropup"), for: .normal)
            self.seaLabelShow.text = self.org[2].orgMission
        }
    }

    
}
