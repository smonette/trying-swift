//
//  TableViewController.swift
//  first-app
//
//  Created by Steph Monette on 8/23/16.
//  Copyright © 2016 Steph Monette. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    let apps: [String] = ["Colors", "App 2", "App 3"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Some apps"
        // Register the table view cell class and its reuse id
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.apps[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.row == 0 {
            print("You tapped cell number \(indexPath.row)." + "Open App 1")
            self.performSegueWithIdentifier("app1", sender: nil)
        } else if indexPath.row == 1 {
            print("You tapped cell number \(indexPath.row)." + "Open App 2")
            self.performSegueWithIdentifier("app2", sender: nil)
        } else if indexPath.row == 2 {
            print("You tapped cell number \(indexPath.row)." + "Open App 3")
            self.performSegueWithIdentifier("app3", sender: nil)
        }

    }
    

}