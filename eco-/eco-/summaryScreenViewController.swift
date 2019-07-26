//
//  summaryScreenViewController.swift
//  eco-
//
//  Created by Joseph Duodu on 7/25/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class summaryScreenViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

   
    @IBOutlet weak var inventoryTableView: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let cellSpacingHeight: CGFloat = 10
    
    
    var sampleInventories = InventoryManager(listOfInventories: [
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision"),
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision"),
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision"),
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision"),
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision"),
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision"),
        Inventory(taskDate: "02/25/2019", taskTime: "2 hrs 30 mins", taskTitle: "Calculus revision")
        ])
    
    /* func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return sampleInventories.listOfInventories.count
     } */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sampleInventories.listOfInventories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = inventoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! sampleTableViewCell
        
        let item = sampleInventories.listOfInventories[indexPath.section]
        cell.dateLabel?.text = item.taskDate
        cell.timeLabel?.text = item.taskTime
        cell.taskLabel?.text = item.taskTitle
        
        //cell.backGroundView.layer.cornerRadius = 10
        cell.backGroundView.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        //cell.backGroundView.layer.
        //cell.backGroundView.backgroundColor = UIColor.red
        //        cell.backGroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        //        cell.backGroundView.layer.shadowColor = UIColor.black.cgColor
        //       cell.backGroundView.layer.shadowOpacity = 0.23
        //        cell.backGroundView.layer.shadowRadius = 4
        return cell
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}
