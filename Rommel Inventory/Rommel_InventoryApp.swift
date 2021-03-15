//
//  Rommel_InventoryApp.swift
//  Rommel Inventory
//
//  Created by Rommel Sim on 13/3/21.
//

import SwiftUI

@main
struct Rommel_InventoryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            tabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
