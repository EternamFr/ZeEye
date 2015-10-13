//
//  Activity.swift
//  ZeEye
//
//  Created by David Christy on 03/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation
import UIKit

struct Activity : HasJsonInitializer {
    let date: String?
    let stepCompleted: CGFloat?
    let sequenceCompleted: CGFloat?
    let day: Int?
    let month: Int?
    let dayName: String?
    let weekNumber: Int?
    
    init(json: [String:AnyObject], index: Int) {
        date = json["date"] as? String
        stepCompleted = json["stepCompleted"] as? CGFloat
        sequenceCompleted = json["sequenceCompleted"] as? CGFloat
        day = json["day"] as? Int
        month = json ["month"] as? Int
        dayName = json["dayName"] as? String
        weekNumber = json["weekNumber"] as? Int
    }
}