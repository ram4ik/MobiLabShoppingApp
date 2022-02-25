//
//  ShoppingForm.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import Foundation

class ShoppingForm: ObservableObject {
    @Published var title = ""
    @Published var notes = ""
    @Published var quantity = 1
    
    var shoppingItemId: Int?
    
    var updating: Bool {
        shoppingItemId != nil
    }
    
    init() {}
    
    init(_ shoppingItem: ShoppingItem) {
        shoppingItemId = shoppingItem.id
        title = shoppingItem.title
        notes = shoppingItem.notes
        quantity = shoppingItem.quantity
    }
}
