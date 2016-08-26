//
//  ApiViewController.swift
//  first-app
//
//  Created by Steph Monette on 8/24/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class ApiViewController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "NASA API"
        
                
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let apiController = APIController()
        let today = NSDate()
        apiController.getAPOD(today)
    }

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



}
