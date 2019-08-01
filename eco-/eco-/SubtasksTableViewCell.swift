//
//  SubtasksTableViewCell.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/31/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class SubtasksTableViewCell: UITableViewCell {

    
    @IBOutlet weak var subtaskLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
