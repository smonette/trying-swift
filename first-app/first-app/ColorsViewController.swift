//
//  ColorsViewController.swift
//  first-app
//
//  Created by Steph Monette on 8/18/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var brick1: UIView!
    @IBOutlet weak var brick2: UIView!
    @IBOutlet weak var brick3: UIView!
    @IBOutlet weak var brick4: UIView!
    @IBOutlet weak var brick5: UIView!
    @IBOutlet weak var brick6: UIView!
    @IBOutlet weak var brick7: UIView!
    @IBOutlet weak var brick8: UIView!
    @IBOutlet weak var brick9: UIView!
    @IBOutlet weak var brick10: UIView!
    @IBOutlet weak var brick11: UIView!
    @IBOutlet weak var brick12: UIView!
    @IBOutlet weak var brick13: UIView!
    @IBOutlet weak var brick14: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button1(_ sender: AnyObject) {
        changeColor(brick1)
        changeColor(brick2)
        changeColor(brick3)
        changeColor(brick4)
        changeColor(brick5)
        changeColor(brick6)
        changeColor(brick7)
        changeColor(brick8)
        changeColor(brick9)
        changeColor(brick10)
        changeColor(brick11)
        changeColor(brick12)
        changeColor(brick13)
        changeColor(brick14)
    }
    
    func changeColor(_ passedView:UIView) {
        // Generate Random Numbers
        let r = CGFloat(arc4random() % 255)
        let g = CGFloat(arc4random() % 255)
        let b = CGFloat(arc4random() % 255)
        
        // Create Color
        let color = UIColor(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: 1.0)
        passedView.backgroundColor=color;
    }
    
    
}


