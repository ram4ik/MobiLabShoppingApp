//
//  ShoppingStoreTests.swift
//  MobiLabShoppingAppTests
//
//  Created by ramil on 25.02.2022.
//

import XCTest
@testable import MobiLabShoppingApp

class ShoppingStoreTests: XCTestCase {

    func testCreateItem() {
        
        let shoppingStore = ShoppingStore(realm: RealmPersistence.initializer())
        let item = ShoppingItem(id: 1, title: "FirstTitle", notes: "FirstNotes", bought: false, quantity: 1)
        
        shoppingStore.create(title: item.title, notes: item.notes, quantity: item.quantity)
        shoppingStore.delete(itemId: item.id)
    }
    
    func testCreateBoughtItem() {
        
        let shoppingStore = ShoppingStore(realm: RealmPersistence.initializer())
        let item = ShoppingItem(id: 2, title: "SecondTitle", notes: "SecondNotes", bought: true, quantity: 1)
        
        shoppingStore.create(title: item.title, notes: item.notes, quantity: item.quantity)
        shoppingStore.deleteBought(itemId: item.id)
    }
    

}
