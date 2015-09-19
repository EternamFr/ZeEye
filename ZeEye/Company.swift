//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

// http://192.168.1.123/companies.json

import Foundation

struct Company {
    let id: Int?
    let name: String?
    let description: String?
    let activeUsers: Int?
    let thumbnail: String?
    
    init(firmDictionary: [String:AnyObject]) {
        id = firmDictionary["id"] as? Int
        name = firmDictionary["name"] as? String
        description = firmDictionary["description"] as? String
        activeUsers = firmDictionary["users"] as? Int
        thumbnail = firmDictionary["thumbnail"] as? String
        
        if let processes = firmDictionary["processes"] as? [String:Int] {
            for (key, value) in processes {
                switch key {
                case "mus":
                    break;
                default:
                    break;
                }
            }
        }
        
    }
}