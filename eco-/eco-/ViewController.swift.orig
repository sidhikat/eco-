//hi 
//  ViewController.swift
//  eco-
//
//  Created by Sidhika Tripathee, Akoly Vongdala, Guilherme Hohenfeld, Joey Duodu on 7/19/19.
//  Copyright © 2019 Sidhika Tripathee, Akoly Vongdala, Guilherme Hohenfeld, Joey Duodu. All rights reserved.
//

import UIKit
import CoreData




class ViewController: UIViewController {
    var container:NSPersistentContainer!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard container != nil else {
            fatalError("This view needs a persistent container.")
            // Do any additional setup after loading the view.
        }
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the SECOND view controller
        if  let secondViewController = segue.destination as? loginPageViewController {
            // set a variable in the SECOND view controller with the String to pass
            secondViewController.container = self.container
        }
    }


}

