//
//  GroceryList.swift
//  SimpleGroceryList
//
//  Created by Clint Bush on 10/2/24.
//

import Foundation
import SwiftData

@Model
final class GroceryItem {
    var id: UUID
    var title: String
    var inCart: Bool
    var primaryCategory: String
    var createDate: Date
    var completeDate: Date?
    
    init(title: String, primaryCategory: String, inCart: Bool = false) {
        self.id = UUID()
        self.title = title
        self.inCart = inCart
        self.primaryCategory = primaryCategory
        self.createDate = Date()
    }
}

