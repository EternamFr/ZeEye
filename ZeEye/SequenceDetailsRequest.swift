//
//  SequenceDetailsRequest.swift
//  ZeEye
//
//  Created by David Christy on 13/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

struct SequenceDetailsRequest {
    let companyUuid: String
    let processTemplateId: Int
    
    init(companyUuid: String, processTemplateId: Int) {
        self.companyUuid = companyUuid
        self.processTemplateId = processTemplateId
    }
}