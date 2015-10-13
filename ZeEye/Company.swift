//
//  Company.swift
//  ZeEye
//
//  Created by David Christy on 11/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
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
        }
    }
}
