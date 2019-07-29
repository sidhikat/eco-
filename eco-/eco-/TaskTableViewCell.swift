//
//  TaskTableViewCell.swift
//  eco-
//
//  Created by Sidhika Tripathee on 7/22/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

//includes all elements part of the taskList table cell
class TaskTableViewCell: UITableViewCell{
    
    //@IBOutlet weak var subtaskLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var checkBoxButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setTableViewDataSourceDelegate
//        <D: UITableViewDelegate & UITableViewDataSource>(_ dataSourceDelegate: D, forRow row: Int){
//        subtaskTableView.delegate = dataSourceDelegate
//        subtaskTableView.dataSource = dataSourceDelegate
//
//        subtaskTableView.reloadData()
//    }
    

}
