//
//  CompanyService.swift
//  ZeEye
//
//  Created by David Christy on 13/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

struct DataService {
    
    func GetEntities<U: HasJsonInitializer>(url: String, key: String, completion: ([U]?->Void)) {
        guard let entitiesUrl = NSURL(string: url)
            else {
                print("Could not construct a valid URL")
                return
        }
        
        let networkOperation = NetworkOperation(url: entitiesUrl)
        networkOperation.downloadJSONFromURl {
            (let jsonDictionary) in
            
            let entities: [U] = self.entitiesFromJSONDictionary(key, jsonDictonary: jsonDictionary)!
            completion(entities)
        }
    }
    
    func entitiesFromJSONDictionary<U: HasJsonInitializer>(key: String, jsonDictonary: [String:AnyObject]?) -> [U]? {
        let entities = jsonDictonary?[key] as! [AnyObject];
        
        var result = [U]();
        
        for (order, value) in entities.enumerate() {
            if let entityDictionary = value as? [String:AnyObject] {
                let entity: U = U(json: entityDictionary, index: order + 1) // Tags have a default of 0... so can't be 0, hence the +1...
                result.append(entity);
            }
        }
        
        return result;
    }
    
    func GetCompanies(completion: ([Company]?->Void)) {
        self.GetEntities("https://stories.xafir.com/api/v1/companies", key: "companies", completion: completion)
    }
    
    func GetActivities(completion: ([Activity]?->Void), companyUuid: String, todayOffset: Int) {
        self.GetEntities("https://stories.xafir.com/api/v1/companies/\(companyUuid)/activities?todayoffset=\(todayOffset)", key: "activities", completion: completion)
    }
    
    func GetSequencesCount(completion: ([SequenceCount]?->Void), companyUuid: String, processTemplateId: Int) {
        self.GetEntities("https://stories.xafir.com/api/v1/companies/\(companyUuid)/ActiveSequencesCount/\(processTemplateId)", key: "activities", completion: completion)
    }
}

