//
//  sampleTableViewCell.swift
//  eco-
//
//  Created by Joseph Duodu on 7/25/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class sampleTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
