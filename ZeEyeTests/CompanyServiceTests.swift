//
//  CompanyServiceTests.swift
//  ZeEye
//
//  Created by David Christy on 13/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import UIKit
import XCTest

class CompanyServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let dataService = DataService();
        dataService.GetCompanies(Completion);
        
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func Completion(companies: [Company]?) {
        let _ = companies;
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
