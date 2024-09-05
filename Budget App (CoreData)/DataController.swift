//
//  Persistence.swift
//  Budget App (CoreData)
//
//  Created by gabriel carreno on 9/3/24.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Budget_App_CoreData")
    
    init() {
        container.loadPersistentStores{ decription, error in if let error = error {
            print("Core Data failed to load: \(error.localizedDescription)")
            
            }
        }
    }
}

// this replaces apples default controller..
// "Managed object"
// serializes data and tells Coredata how and where to get data from

