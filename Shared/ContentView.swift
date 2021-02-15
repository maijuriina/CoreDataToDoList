//
//  ContentView.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 15/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest (fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's next?")) {
                    HStack {
                        TextField("New item", text: self.$newToDoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.viewContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.timestamp = Date()
                            
                            do {
                                try self.viewContext.save()
                            } catch {
                                print(error)
                            }
                            
                            self.newToDoItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                        .disabled(newToDoItem.isEmpty)
                    }
                }.font(.headline)
                
                Section(header: Text("To Do's")) {
                    ForEach(self.toDoItems) { item in
                        ToDoItemView(title: item.title!, timestamp: "\(item.timestamp!)")
                    }
                    .onDelete {indexSet in
                        let deleteItem = self.toDoItems[indexSet.first!]
                        self.viewContext.delete(deleteItem)
                        
                        do {
                            try self.viewContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
