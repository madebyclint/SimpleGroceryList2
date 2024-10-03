//
//  AddNewItem.swift
//  SimpleGroceryList
//
//  Created by Clint Bush on 10/2/24.
//

import SwiftUI
import SwiftData

struct AddNewItem: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var primaryCategories: [PrimaryCategory]
    
    @State private var title: String = ""
    @State private var primaryCategory: String
    
    init(primaryCategories: [PrimaryCategory]) {
        self.primaryCategories = primaryCategories
        _primaryCategory = State(initialValue: primaryCategories[0].title)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Title")
                TextField("Enter item name", text: $title)
                
                Picker(selection: $primaryCategory) {
                    ForEach(primaryCategories) { primaryCategory in
                        Text(primaryCategory.title)
                            .tag(primaryCategory.title)
                    }
                } label: {
                Text("")
                }
                .labelsHidden()
            }
        }
    }
}

//#Preview {
//    AddNewItem()
//}
