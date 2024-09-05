//
//  Budget_App__CoreData_App.swift
//  Budget App (CoreData)
//
//  Created by gabriel carreno on 9/3/24.
//

import SwiftUI

@main
struct Budget_App__CoreData_App: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
