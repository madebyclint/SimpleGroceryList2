//
//  SimpleGroceryListApp.swift
//  SimpleGroceryList
//
//  Created by Clint Bush on 10/2/24.
//

import SwiftUI
import SwiftData

@main
struct SimpleGroceryListApp: App {
    var sharedModelContainer: ModelContainer {
        let schema = Schema([
            GroceryItem.self,
            PrimaryCategory.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            let sampleCategories: [PrimaryCategory] = [
                PrimaryCategory(title: "aisles"),
                PrimaryCategory(title: "refrigerated"),
                PrimaryCategory(title: "produce")
            ]

            for category in sampleCategories {
                container.mainContext.insert(category)
            }
            
            let sampleItems: [GroceryItem] = [
                GroceryItem(title: "almond milk", primaryCategory: "refrigerated"),
                GroceryItem(title: "eggs", primaryCategory: "refrigerated"),
                GroceryItem(title: "jasmine rice", primaryCategory: "aisles")
            ]
            
            for item in sampleItems {
                container.mainContext.insert(item)
            }

            return container
        } catch {
            fatalError("Error occured while seeding data\(error.localizedDescription)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
