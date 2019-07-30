//
//  summaryTableViewCell.swift
//  eco-
//
//  Created by Joseph Duodu on 7/30/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class summaryTableViewCell: UITableViewCell {

    @IBOutlet weak var DateLabel:UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var backGround: UIView! {
        didSet {
            backGround.layer.cornerRadius = 30
            backGround.layer.shadowOpacity = 10
            backGround.layer.shadowRadius = 10
            backGround.layer.shadowColor = UIColor(named: "Orange")?.cgColor
            backGround.layer.shadowOffset = CGSize(width: 3, height: 3)
            backGround.backgroundColor = UIColor.lightGray
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
