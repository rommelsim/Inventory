//
//  Item+CoreDataProperties.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 14/3/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var favourite: Bool
    @NSManaged public var id: UUID
    @NSManaged public var length: Int16
    @NSManaged public var name: String
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var type: String
    @NSManaged public var image: Data
    @NSManaged public var date: Date
    @NSManaged public var sellerData: Seller

}

extension Item : Identifiable {

}
