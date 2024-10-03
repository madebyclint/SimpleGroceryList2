//
//  PrimaryCategory.swift
//  SimpleGroceryList
//
//  Created by Clint Bush on 10/2/24.
//

import Foundation
import SwiftData

@Model
final class PrimaryCategory {
    var id: UUID
    var title: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
    }
}
