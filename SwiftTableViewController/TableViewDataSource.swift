//
//  TableViewDataSource.swift
//  SwiftTableViewController
//
//  Created by user29862 on 6/19/15.
//  Copyright (c) 2015 Harry Bloom. All rights reserved.
//

import UIKit
import Foundation

typealias TableViewCellConfigureBlock = (cell:UITableViewCell, item:AnyObject?) -> ()

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    var items:NSArray = []
    var itemIdentifier:String?
    var configureCellBlock:TableViewCellConfigureBlock?
    
    init(items: NSArray, cellIdentifier: String, configureBlock: TableViewCellConfigureBlock) {
        self.items = items
        self.itemIdentifier = cellIdentifier
        self.configureCellBlock = configureBlock
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.itemIdentifier!, forIndexPath: indexPath) as! UITableViewCell
        let item: AnyObject = self.itemAtIndexPath(indexPath)
        
        if (self.configureCellBlock != nil) {
            self.configureCellBlock!(cell: cell, item: item)
        }
        
        return cell
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject {
        return self.items[indexPath.row]
    }
    
}