//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import Foundation

class Company {
    
    let name: String
    let activeUsers: Int
    
    init(name: String, activeUsers: Int) {
        self.name = name
        self.activeUsers = activeUsers
    }
    
    class func getAllCompanies() -> [Company] {
        let companies = [
            Company(name:"Biomar", activeUsers: 1450),
            Company(name:"DesignIt", activeUsers: 2),
            Company(name:"Kammer", activeUsers: 50)]
        
        return companies
    }
    
}