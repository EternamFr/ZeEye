//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

// http://192.168.1.123/companies.json

import Foundation
import GameKit

struct Company : HasJsonInitializer {
    let order: Int?
    let uuid: String?
    let name: String?
    let description: String?
    let activeUsers: Int?
    let thumbnailUrl: String?
    var musProcessesCount: Int?
    var threeSixtyProcessesCount: Int?
    
    init(json: [String:AnyObject], index: Int) {
        order = index
        
        uuid = json["uuid"] as? String
        name = json["name"] as? String
        description = json["description"] as? String
        activeUsers = json["activeUsers"] as? Int
        thumbnailUrl = json["thumbnailUrl"] as? String
        
        musProcessesCount = GKRandomSource.sharedRandom().nextIntWithUpperBound(1000)
        threeSixtyProcessesCount = GKRandomSource.sharedRandom().nextIntWithUpperBound(1000)
        
//        if let processes = json["processes"] as? [String:Int] {
//            for (key, value) in processes {
//                switch key {
//                case EvaluationType.mus.rawValue:
//                    musProcessesCount = value
//                case EvaluationType.threesixty.rawValue:
//                    threeSixtyProcessesCount = value
//                default:
//                    break
//                }
//            }
//        }
    }
}

struct ProcessCount {
    let evaluationType: EvaluationType?
    let count: Int?
}

struct Activity : HasJsonInitializer {
    let date: String? // "date":"24-09-2015",
    let stepCompleted: CGFloat? // "stepCompleted": 39,
    let sequenceCompleted: CGFloat? // "sequenceCompleted": 6
    
    init(json: [String:AnyObject], index: Int) {
        date = json["date"] as? String
        stepCompleted = json["stepCompleted"] as? CGFloat
        sequenceCompleted = json["sequenceCompleted"] as? CGFloat
    }
}