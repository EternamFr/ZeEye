//
//  Activity.swift
//  ZeEye
//
//  Created by David Christy on 01/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

public struct Activity : HasJsonInitializer {
    let date: String? // "date":"24-09-2015",
    let stepCompleted: Int? // "stepCompleted": 39,
    let sequenceCompleted: Int? // "sequenceCompleted": 6
    
    public init(json: [String:AnyObject], index: Int) {
        date = json["date"] as? String
        stepCompleted = json["stepCompleted"] as? Int
        sequenceCompleted = json["sequenceCompleted"] as? Int
    }
}
