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
    let description: String
    let activeUsers: Int
    
    init(name: String, description: String, activeUsers: Int) {
        self.name = name
        self.description = description
        self.activeUsers = activeUsers
    }
    
    class func getAllCompanies() -> [Company] {
        let companies = [
            Company(name:"Biomar", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vel blandit arcu, at aliquet metus.", activeUsers: 1450),
            Company(name:"DesignIt", description:"Etiam purus ex, malesuada id tincidunt ut, ultricies nec mi.", activeUsers: 2),
            Company(name:"Djh", description:"Suspendisse nec ultricies nulla, a aliquet elit. Interdum et malesuada fames ac ante ipsum primis in faucibus.", activeUsers: 35),
            Company(name:"Kammer", description:"Maecenas quis sapien augue. Curabitur laoreet ipsum elit, et porttitor eros vehicula sed. Phasellus faucibus laoreet urna sit amet condimentum. Morbi sollicitudin interdum pharetra.", activeUsers: 50)]
        
        return companies
    }
    
}