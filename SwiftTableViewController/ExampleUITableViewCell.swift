//
//  ExampleUITableViewCell.swift
//  SwiftTableViewController
//
//  Created by user29862 on 6/19/15.
//  Copyright (c) 2015 Harry Bloom. All rights reserved.
//

import UIKit

class ExampleUITableViewCell: UITableViewCell {
    
    func configureForItem(item:ExampleObject) {
        
        self.textLabel!.text = item.title
    }
}
