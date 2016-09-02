//
//  ApiViewController.swift
//  first-app
//
//  Created by Steph Monette on 8/24/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class ApiViewController: UIViewController {
    var emailAddress = ""
    var phoneNumber = ""

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneLabel: UIButton!
    @IBOutlet weak var emailLabel: UIButton!
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Some Rando"
        fetchRandos()
        uiStyling()
    }

    
    
    @IBAction func moreRandosButton(sender: AnyObject) {
        fetchRandos()
        uiStyling()
    }
    
    @IBAction func sendEmailButton(sender: AnyObject) {
        if let emailUrl = NSURL(string: "mailto:" + emailAddress){
            UIApplication.sharedApplication().openURL(emailUrl)
        }
    }

    @IBAction func makeCallButton(sender: AnyObject) {
        if let phoneUrl = NSURL(string: "tel://" + phoneNumber) {
            UIApplication.sharedApplication().openURL(phoneUrl)
        }
        
    }

    
    // MARK: - API Call
    func fetchRandos() {
        
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
                    
                    let loginData = (json["results"] as! NSArray)[0]["login"] as! NSDictionary
                    let usernameData = loginData["username"] as? String
                    
                    let userEmail = (json["results"] as! NSArray)[0]["email"] as! String
                    
                    let userPhone = (json["results"] as! NSArray)[0]["cell"] as! String
                    
                    let imgData = (json["results"] as! NSArray)[0]["picture"] as! NSDictionary
                    let userImg = imgData["large"] as? String
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        if let imgUrl  = NSURL(string: userImg!), data = NSData(contentsOfURL: imgUrl) {
                            self.imageView.image = UIImage(data: data)
                        }
                        
                        self.nameLabel.text = fullNameData
                        self.usernameLabel.text = usernameData
                        
                        self.emailLabel.setTitle(userEmail, forState: UIControlState.Normal)
                        self.emailAddress = userEmail

                        self.phoneLabel.setTitle(userPhone, forState: UIControlState.Normal)
                        self.phoneNumber = userPhone
                        
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
    // MARK: - UI Styles
    func uiStyling() {
        imageView.layer.cornerRadius = 50
    }


}
