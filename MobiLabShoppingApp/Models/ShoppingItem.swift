//
//  ShoppingItem.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id: Int
    let title: String
    let notes: String
    let bought: Bool
    let quantity: Int
}

//MARK: - init
extension ShoppingItem {
    init(shoppingItemDB: ShoppingItemDB) {
        id = shoppingItemDB.id
        title = shoppingItemDB.title
        notes = shoppingItemDB.notes
        bought = shoppingItemDB.bought
        quantity = shoppingItemDB.quantity
    }
}
