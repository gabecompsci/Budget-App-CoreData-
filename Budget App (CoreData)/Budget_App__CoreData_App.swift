//
//  Budget_App__CoreData_App.swift
//  Budget App (CoreData)
//
//  Created by gabriel carreno on 9/3/24.
//

import SwiftUI

@main
struct Budget_App__CoreData_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
