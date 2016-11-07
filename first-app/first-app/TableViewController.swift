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
    let apps: [String] = ["Colors", "Rando Generator", "Calculator"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    // don't forget to hook this up from the storyboard
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Some apps"
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.apps[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 {
            print("You tapped cell number \(indexPath.row)." + "Open App 1")
            self.performSegue(withIdentifier: "app1", sender: nil)
        } else if indexPath.row == 1 {
            print("You tapped cell number \(indexPath.row)." + "Open App 2")
            self.performSegue(withIdentifier: "app2", sender: nil)
        } else if indexPath.row == 2 {
            print("You tapped cell number \(indexPath.row)." + "Open App 3")
            self.performSegue(withIdentifier: "app3", sender: nil)
        }

    }
    

}
