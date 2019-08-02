//
//  OrgCategory.swift
//  eco-
//
//  Created by Akoly Vongdala on 7/22/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import Foundation

// model for the organization category (e.g. Bees, Trees, and Seas)
struct OrgCategory {
    
    var id : Int
    var category : String
    var description : String
    var image : String
}

struct organization {
    var orgName: String
    var orgMission: String
}

// model for specific organization
struct Organization {
    var orgName : String
    var orgMission: String
    //var orgCategory: OrgCategory
}
