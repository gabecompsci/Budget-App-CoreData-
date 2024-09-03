//
//  Budgetattributes+CoreDataProperties.swift
//  Budget App (CoreData)
//
//  Created by gabriel carreno on 9/3/24.
//
//

import Foundation
import CoreData


extension Budgetattributes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Budgetattributes> {
        return NSFetchRequest<Budgetattributes>(entityName: "Budgetattributes")
    }

    @NSManaged public var highpriority: Bool
    @NSManaged public var amount: Int64
    @NSManaged public var title: String?

}

extension Budgetattributes : Identifiable {

}
