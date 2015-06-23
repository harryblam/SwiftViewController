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
    var exampleItems = [ExampleObject]()
    
    //variable to hold reference to the datasource
    var dataSource:TableViewDataSource?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exampleItems.append(ExampleObject(title: "Hello World"))
        
        //Init our datasource and setup the closure to handle our cell
        //modify 'AnyObject' to match your model
        self.dataSource = TableViewDataSource(items: exampleItems, cellIdentifier: "Cell", configureBlock: { (cell, item) -> () in
            if let actualCell = cell as? ExampleUITableViewCell {
//                if let actualItem = item as? ExampleObject {
//                    actualCell.configureForItem(actualItem?)
//                }
                actualCell.configureForItem(item!)
            }
        })
        
        //finally, set the collectionview datasource
        self.tableView.dataSource = self.dataSource
        
    }
    

}

