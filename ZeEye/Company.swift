//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import Foundation

class Company {
    
    let id: Int
    let name: String
    let description: String
    let activeUsers: Int
    let thumbnail: String
    
    init(id: Int, name: String, description: String, activeUsers: Int, thumbnail: String) {
        self.id = id
        self.name = name
        self.description = description
        self.activeUsers = activeUsers
        self.thumbnail = thumbnail
    }
    
    class func getAllCompanies() -> [Company] {
        let companies = [
            Company(id:1, name:"Biomar", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel blandit arcu, at aliquet metus.", activeUsers: 1450, thumbnail: "biomar"),
            Company(id:2, name:"Design It", description:"Etiam purus ex, malesuada id tincidunt ut, ultricies nec mi.", activeUsers: 2, thumbnail: "designit"),
            Company(id:3, name:"Djh", description:"Suspendisse nec ultricies nulla, a aliquet elit. Interdum et malesuada fames ac ante ipsum primis in faucibus.", activeUsers: 35, thumbnail: "djh"),
            Company(id:4, name:"LÉON", description:"Maecenas quis sapien augue. Curabitur laoreet ipsum elit, et porttitor eros vehicula sed. Phasellus faucibus laoreet urna sit amet condimentum. Morbi sollicitudin interdum pharetra.", activeUsers: 50, thumbnail: "kammer")
        ]
        
        return companies
    }
    
}