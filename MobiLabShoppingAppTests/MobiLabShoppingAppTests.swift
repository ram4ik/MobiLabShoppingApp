//
//  MobiLabShoppingAppTests.swift
//  MobiLabShoppingAppTests
//
//  Created by ramil on 25.02.2022.
//

import XCTest
@testable import MobiLabShoppingApp

class ShoppingStoreTests: XCTestCase {
    
    func testCreateItem() {
        
        let store = ShoppingStore(realm: RealmPersistence.initializer())
        let item = ShoppingItem(id: 1, title: "FirstTitle", notes: "FirstNotes", bought: false, quantity: 1)
        let form = ShoppingForm(item)
        
        store.create(title: form.title, notes: form.notes, quantity: form.quantity)
        store.delete(itemId: store.items.first?.id ?? 1)
        
    }
    
    func testCreateBoughtItem() {
        
        let store = ShoppingStore(realm: RealmPersistence.initializer())
        let item = ShoppingItem(id: 1, title: "SecondTitle", notes: "SecondNotes", bought: true, quantity: 1)
        let form = ShoppingForm(item)
        
        store.create(title: form.title, notes: form.notes, quantity: form.quantity)
        store.delete(itemId: store.items.first?.id ?? 1)
    }
    

}
