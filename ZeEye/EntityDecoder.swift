//
//  CompanyDecoder.swift
//  ZeEye
//
//  Created by David Christy on 01/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

//public protocol HasJsonInitializer {
//    init(json: [String:AnyObject], index: Int)
//}

protocol EntityDecoder {
    func decode<U: HasJsonInitializer>(json: [String:AnyObject], index: Int) -> U
}

extension EntityDecoder {
    func decode<U: HasJsonInitializer>(json: [String : AnyObject], index: Int) -> U {
        return U(json: json, index: index)
    }
}