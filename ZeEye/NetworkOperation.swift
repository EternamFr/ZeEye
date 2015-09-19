//
//  NetworkOperation.swift
//  ZeEye
//
//  Created by David Christy on 13/09/2015.
//  Copyright © 2015 David Christy. All rights reserved.
//

import Foundation

public class NetworkOperation {
    
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    let queryURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String:AnyObject]?) -> Void
    
    init(url: NSURL) {
        self.queryURL = url
        
        config.requestCachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
    }
    
    func downloadJSONFromURl(completion: JSONDictionaryCompletion) {
        let request = NSURLRequest(URL: queryURL)
        
        let dataTask = session.dataTaskWithRequest(request) {
            (let data: NSData?, let response: NSURLResponse?, let error: NSError?) -> Void in
            
            sleep(4);
            
            // 1: Check HTTP Response for successful GET request
            guard let httpResponse = response as? NSHTTPURLResponse, receivedData = data
                else {
                    print("error: not a valid http response")
                    return
            }
            
            switch (httpResponse.statusCode) {
            case 200:
                // 2: Create JSON object with data
                do {
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(receivedData, options: NSJSONReadingOptions.AllowFragments)
                        as? [String:AnyObject]
                    
                    // 3: Pass the json back to the completion handler
                    completion(jsonDictionary)
                } catch {
                    print("error parsing json data")
                }
            default:
                print("GET request got response \(httpResponse.statusCode)")
            }
        }
        dataTask.resume()
    }
}