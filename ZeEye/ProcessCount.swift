//
//  ProcessCount.swift
//  ZeEye
//
//  Created by David Christy on 11/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

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
}