//
//  InventoryManager.swift
//  eco-
//
//  Created by Joseph Duodu on 7/25/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

class InventoryManager: NSObject {
    
    var listOfInventories:[Inventory]
    
    init(listOfInventories:[Inventory])
    {
        self.listOfInventories = listOfInventories
    }
    
    func addInvent(newInventory: Inventory)
    {
        self.listOfInventories.append(newInventory)
    }

}
