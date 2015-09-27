//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

// http://192.168.1.123/companies.json

import Foundation

public struct Company {
    let id: Int?
    let name: String?
    let description: String?
    let activeUsers: Int?
    let thumbnail: String?
    var musProcessesCount: Int?
    var threeSixtyProcessesCount: Int?
    
    init(json: [String:AnyObject]) {
        id = json["id"] as? Int
        name = json["name"] as? String
        description = json["description"] as? String
        activeUsers = json["users"] as? Int
        thumbnail = json["thumbnail"] as? String
        
        if let processes = json["processes"] as? [String:Int] {
            for (key, value) in processes {
                switch key {
                case EvaluationType.mus.rawValue:
                    musProcessesCount = value
                case EvaluationType.threesixty.rawValue:
                    threeSixtyProcessesCount = value
                default:
                    break
                }
            }
        }
        
    }
}

struct ProcessCount {
    let evaluationType: EvaluationType?
    let count: Int?
}