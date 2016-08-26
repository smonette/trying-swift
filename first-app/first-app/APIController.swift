//
//  APIController.swift
//  first-app
//
//  Created by Steph Monette on 8/26/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class APIController {
    let API_KEY = "MY_API_KEY"
    
    func dateToString(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.stringFromDate(date)
    }
    
    func createURLWithString(date: NSDate) -> NSURL? {
        var urlString: String = "https://api.nasa.gov/planetary/apod"
        
        // append params
        urlString = urlString.stringByAppendingString("?date=" + dateToString(date))
        urlString = urlString.stringByAppendingString("&concept_tags=false")
        urlString = urlString.stringByAppendingString("&hd=false")
        urlString = urlString.stringByAppendingString("&api_key=" + API_KEY)
        
        return NSURL(string: urlString)
    }
    
    func createURLWithComponents(date: NSDate) -> NSURL? {
        // create "https://api.nasa.gov/planetary/apod" URL using NSURLComponents
        let urlComponents = NSURLComponents()
        urlComponents.scheme = "https";
        urlComponents.host = "api.nasa.gov";
        urlComponents.path = "/planetary/apod";
        
        // add params
        let dateQuery = NSURLQueryItem(name: "date", value: dateToString(date))
        let conceptQuery = NSURLQueryItem(name: "concept_tags", value: "false")
        let hdQuery = NSURLQueryItem(name: "hd", value: "false")
        let apiKeyQuery = NSURLQueryItem(name: "api_key", value: API_KEY)
        urlComponents.queryItems = [dateQuery, conceptQuery, hdQuery, apiKeyQuery]
        
        return urlComponents.URL
    }
    
    func getAPOD(date: NSDate) {
        guard let url = createURLWithComponents(date) else {
            print("invalid URL")
            return
        }
        
        let urlRequest = NSURLRequest(URL: url)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: { (data, _, _) in
            do {
                
                if let data = data, let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject] {
                    print(json)
                    if let imageURLString = json["url"] as? String {
                        if let url = NSURL(string: imageURLString) {
                            UIApplication.sharedApplication().openURL(url)
                            return
                        }
                    }
                }
            } catch {
                // handle the error
            }
        })
        task.resume()
    }
}
