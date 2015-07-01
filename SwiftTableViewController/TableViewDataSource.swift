//
//  TableViewDataSource.swift
//  SwiftTableViewController
//
//  Created by user29862 on 6/19/15.
//  Copyright (c) 2015 Harry Bloom. All rights reserved.
//

import UIKit
import Foundation

typealias TableViewCellConfigureBlock = (cell:UITableViewCell, item:ExampleObject?) -> ()

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var items: [ExampleObject]
    var itemIdentifier:String?
    var configureCellBlock:TableViewCellConfigureBlock?
    
    init(cellIdentifier: String, configureBlock: TableViewCellConfigureBlock) {
        
        self.items = CoreDataController.fetchExampleObjects()
        
        self.itemIdentifier = cellIdentifier
        self.configureCellBlock = configureBlock
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.itemIdentifier!, forIndexPath: indexPath) as! UITableViewCell
        let item: ExampleObject = self.itemAtIndexPath(indexPath)
        
        if (self.configureCellBlock != nil) {
            self.configureCellBlock!(cell: cell, item: item)
        }
        
        return cell
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> ExampleObject {
        return self.items[indexPath.row]
    }
    
}