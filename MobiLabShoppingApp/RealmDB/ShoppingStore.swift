//
//  ShoppingStore.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import Foundation
import RealmSwift

final class ShoppingStore: ObservableObject {
    private var itemResults: Results<ShoppingItemDB>
    private var boughtItemResults: Results<ShoppingItemDB>
    
    var items: [ShoppingItem] {
        itemResults.map(ShoppingItem.init)
    }
    
    var boughtItem: [ShoppingItem] {
        boughtItemResults.map(ShoppingItem.init)
    }
    
    init(realm: Realm) {
        itemResults = realm.objects(ShoppingItemDB.self).filter("bought = false")
        boughtItemResults = realm.objects(ShoppingItemDB.self).filter("bought = true")
    }
}

// MARK: - CRUD operations
extension ShoppingStore {
    func create(title: String, notes: String, quantity: Int) -> Int {
        objectWillChange.send()
        
        let id = UUID().hashValue
        do {
            let realm = try Realm()
            let shoppingItemDB = ShoppingItemDB()
            shoppingItemDB.id = id
            shoppingItemDB.title = title
            shoppingItemDB.notes = notes
            shoppingItemDB.quantity = quantity
            
            try realm.write {
                realm.add(shoppingItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
        
        return id
    }
    
    func updateItemFromFirestore(realmId: Int, title: String, notes: String, quantity: Int, bought: Bool) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            let shoppingItemDB = ShoppingItemDB()
            shoppingItemDB.id = realmId
            shoppingItemDB.title = title
            shoppingItemDB.notes = notes
            shoppingItemDB.quantity = quantity
            shoppingItemDB.bought = bought
            
            try realm.write {
                realm.create(ShoppingItemDB.self, value: shoppingItemDB, update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func updateBuy(shoppingItem: ShoppingItem) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(ShoppingItemDB.self,
                             value: [
                                ShoppingItemDBKeys.id.rawValue: shoppingItem.id,
                                ShoppingItemDBKeys.bought.rawValue: true
                             ],
                             update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func updateItem(itemId: Int, title: String, notes: String, quantity: Int) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(ShoppingItemDB.self,
                                 value: [
                                    ShoppingItemDBKeys.id.rawValue: itemId,
                                    ShoppingItemDBKeys.title.rawValue: title,
                                    ShoppingItemDBKeys.notes.rawValue: notes,
                                    ShoppingItemDBKeys.quantity.rawValue: quantity
                                 ],
                                 update: .modified)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func delete(itemId: Int) {
        objectWillChange.send()
        
        guard let shoppingItemDB = itemResults.first (where: {$0.id == itemId}) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(shoppingItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func deleteBought(itemId: Int) {
        objectWillChange.send()
        
        guard let shoppingItemDB = boughtItemResults.first (where: {$0.id == itemId}) else {
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(shoppingItemDB)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
}
