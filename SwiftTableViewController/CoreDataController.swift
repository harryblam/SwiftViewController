//
//  CoreDataController.swift
//  SwiftTableViewController
//
//  Created by user29862 on 7/1/15.
//  Copyright (c) 2015 Harry Bloom. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataController {
    
    static func saveExampleObject(obj: ExampleObject) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("ExampleObject",
            inManagedObjectContext:
            managedContext)
        
        let exampleObject = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        //3
        exampleObject.setValue(obj.title, forKey: "title")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
    }
    
    static func fetchExampleObjects() -> [ExampleObject] {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"ExampleObject")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        var exampleObjects = [ExampleObject]()
        
        if let results = fetchedResults {
            
            //change array of nsmanagedobjects to array of ExampleObjects
            for obj in results {
                let title = obj.valueForKey("title") as? String
                
                let exObj = ExampleObject(title: title!)
                
                exampleObjects.append(exObj)
                
            }
            
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        return exampleObjects
    }
}