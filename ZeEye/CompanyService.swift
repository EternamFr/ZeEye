//
//  CompanyService.swift
//  ZeEye
//
//  Created by David Christy on 13/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

struct CompanyService {
    
    func GetCompanies(completion: ([Company]?->Void)) {
        // https://organisations.xafir.com/activities.json
        // http://192.168.1.123/companies.json
        guard let companiesURL = NSURL(string: "https://organisations.xafir.com/companies.json")
            else {
                print("Could not construct a valid URL")
                return
        }
        
        let networkOperation = NetworkOperation(url: companiesURL)
        networkOperation.downloadJSONFromURl {
            (let jsonDictionary) in
            
            let companies = self.companiesFromJSONDictionary(jsonDictionary)
            completion(companies)
        }
    }
    
    func companiesFromJSONDictionary(jsonDictonary: [String:AnyObject]?) -> [Company]? {
        let companies = jsonDictonary?["companies"] as! [AnyObject];
        
        var result = [Company]();
        
        for (_, value) in companies.enumerate() {
            if let companyDictionary = value as? [String:AnyObject] {
                let company = Company(json: companyDictionary);
                result.append(company);
            }
        }
        return result;
    }
}