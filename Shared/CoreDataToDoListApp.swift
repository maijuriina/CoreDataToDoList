//
//  CoreDataToDoListApp.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 15/02/2021.
//

import SwiftUI

@main
struct CoreDataToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
