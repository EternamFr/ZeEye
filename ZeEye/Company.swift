//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 20/02/2015.
//  Copyright (c) 2015 David Christy. All rights reserved.
//

import Foundation
import GameKit

struct Company : HasJsonInitializer {
    let order: Int?
    let uuid: String?
    let name: String?
    let description: String?
    let activeUsers: Int?
    let thumbnailUrl: String?
    var processesCount: [ProcessCount]?
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
        
        if let processes = json["processesCounts"] as? NSArray {
            processesCount = [ProcessCount]()
            for (order, value) in processes.enumerate() {
                if let entityDictionary = value as? [String:AnyObject] {
                    let processCount = ProcessCount(json: entityDictionary, index: order + 1) // Tags have a default of 0... so can't be 0, hence the +1...
                    processesCount!.append(processCount);
                }
            }
            print(processesCount?.count)
        }
    }
}

struct ProcessCount : HasJsonInitializer {
    let evaluationTypeId: EvaluationType?
    let count: Int?
    let processTemplateName: String?
    let processTemplateId: Int?
    
    init(json: [String:AnyObject], index: Int) {
        evaluationTypeId = EvaluationType(rawValue:json["evaluationTypeId"] as? Int ?? 0)
        processTemplateName = json["processTemplateName"] as? String
        processTemplateId = json["processTemplateId"] as? Int
        count = json["count"] as? Int
    }
//    "evaluationTypeId": 6,
//    "processTemplateName": "HR Review 2014/2015",
//    "count": 147,
//    "processTemplateId": 2
}

struct Activity : HasJsonInitializer {
    let date: String?
    let stepCompleted: CGFloat?
    let sequenceCompleted: CGFloat?
    
    init(json: [String:AnyObject], index: Int) {
        date = json["date"] as? String
        stepCompleted = json["stepCompleted"] as? CGFloat
        sequenceCompleted = json["sequenceCompleted"] as? CGFloat
    }
}
