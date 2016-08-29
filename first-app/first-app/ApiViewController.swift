//
//  ApiViewController.swift
//  first-app
//
//  Created by Steph Monette on 8/24/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class ApiViewController: UIViewController {



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Sample API"
        let myUrl = "http://restbus.info/api/agencies/sf-muni/routes/L/stop/5650/predictions"
        
        let requestURL: NSURL = NSURL(string: myUrl)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                
                do {
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let stations = json["ServiceDelivery"] as? [[String: AnyObject]] {
                        
                        for station in stations {
                            
                            if let name = station["stationName"] as? String {
                                
                                if let year = station["buildYear"] as? String {
                                    print(name,year)
                                }
                                
                            }
                        }
                        
                    }
                    
                } catch {
                    print("Error with Json: \(error)")
                }

                
                
            } else {
                print("nothing happened?")
            }
        }
        
        task.resume()
        
    }


}
