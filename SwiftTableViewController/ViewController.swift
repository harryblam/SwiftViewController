//
//  ViewController.swift
//  SwiftTableViewController
//
//  Created by user29862 on 6/19/15.
//  Copyright (c) 2015 Harry Bloom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Example array to represent data set
    var exampleItems: [ExampleObject] = [ExampleObject]() {
        didSet {
            let hasItems = exampleItems.count > 0
            self.tableView.hidden = !hasItems
            self.messageLabel.hidden = hasItems
        }
    }
    
    //variable to hold reference to the datasource
    var dataSource:TableViewDataSource?
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.exampleItems.removeAll(keepCapacity: false)
        //self.exampleItems.append(ExampleObject(title: "Hello World"))

        
        //Init our datasource and setup the closure to handle our cell
        self.dataSource = TableViewDataSource(items: exampleItems, cellIdentifier: "Cell", configureBlock: { (cell, item) -> () in
            if let actualCell = cell as? ExampleUITableViewCell {
                if let actualItem = item as ExampleObject! {
                    actualCell.configureForItem(actualItem)
                }
            }
        })
        
        //finally, set the collectionview datasource
        self.tableView.dataSource = self.dataSource
        
    }
    

    @IBAction func addObject(sender: AnyObject) {
        
        var alert = UIAlertController(title: "New name",
            message: "Add a new name",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default) { (action: UIAlertAction!) -> Void in
                
                let textField = alert.textFields![0] as! UITextField
                self.exampleItems.append(ExampleObject(title: textField.text))
                self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
    }
}

