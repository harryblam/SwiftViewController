//
//  ExampleObject.swift
//  SwiftTableViewController
//
//  Created by user29862 on 6/19/15.
//  Copyright (c) 2015 Harry Bloom. All rights reserved.
//

import Foundation

class ExampleObject : NSObject, NSCoding {
    
    let title : String
    
    @objc required init(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObjectForKey("title") as! String
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
    }
    
    init(title: String){
        self.title = title
    }
}
