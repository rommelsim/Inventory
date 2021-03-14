//
//  Seller+CoreDataProperties.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 13/3/21.
//
//

import Foundation
import CoreData


extension Seller {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Seller> {
        return NSFetchRequest<Seller>(entityName: "Seller")
    }

    @NSManaged public var name: String
    @NSManaged public var phone: String
    @NSManaged public var address: String
    @NSManaged public var company: String
    @NSManaged public var itemData: Item?

}

extension Seller : Identifiable {

}
