//
//  ApiViewController.swift
//  first-app
//
//  Created by Steph Monette on 8/24/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class ApiViewController: UIViewController {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    

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
        uiStyling()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Some Rando"
        let myUrl = "https://randomuser.me/api/"
        
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
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as! NSDictionary
                    
                    let nameData = (json["results"] as! NSArray)[0]["name"] as! NSDictionary
                    let firstNameData = (nameData["first"] as? String)?.capitalizedString
                    let lastNameData = (nameData["last"] as? String)?.capitalizedString
                    let fullNameData = firstNameData! + " " + lastNameData!
                    
                    let imgData = (json["results"] as! NSArray)[0]["picture"] as! NSDictionary
                    let userImg = imgData["large"] as? String

//                    print(json["results"])
                    
                    
                    dispatch_async(dispatch_get_main_queue(), {

                        self.nameLabel.text = fullNameData

                        if let url  = NSURL(string: userImg!), data = NSData(contentsOfURL: url) {
                            self.imageView.image = UIImage(data: data)
                        }
                        
                    })
                    
                    
                    
                } catch {
                    print("Error with Json: \(error)")
                }

                
                
            } else {
                print("nothing happened?")
            }
        }
        
        task.resume()
        
    }

    
    func uiStyling() {
            imageView.layer.cornerRadius = 50
    }


}
