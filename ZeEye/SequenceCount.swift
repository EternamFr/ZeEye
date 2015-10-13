//
//  SequenceCount.swift
//  ZeEye
//
//  Created by David Christy on 08/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

struct SequenceCount : HasJsonInitializer, NameableAndCountable {
    let processSequenceName: String?
    let order: Int?
    let count: Int?
    
    init(json: [String:AnyObject], index: Int) {
        processSequenceName = json["processSequenceName"] as? String
        order = json["order"] as? Int ?? 0
        count = json["count"] as? Int ?? 0
    }
    
    func GetCount() -> Int {
        return count!
    }
    
    func GetName() -> String {
        return processSequenceName!
    }
}
