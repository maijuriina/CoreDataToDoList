//
//  ToDoItem.swift
//  CoreDataToDoList
//
//  Created by Maijuriina Mustonen on 15/02/2021.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    @NSManaged public var timestamp:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as!
        NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
