//
//  Protocols.swift
//  ZeEye
//
//  Created by David Christy on 11/10/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

typealias NameableAndCountable = protocol<Nameable, Countable>

protocol HasJsonInitializer {
    init(json: [String:AnyObject], index: Int)
}

protocol Nameable {
    func GetName() -> String
}

protocol Countable {
    func GetCount() -> Int
}