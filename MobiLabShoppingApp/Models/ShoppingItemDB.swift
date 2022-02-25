//
//  ShoppingItemDB.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import Foundation
import RealmSwift

class ShoppingItemDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var notes = ""
    @objc dynamic var quantity = 1
    @objc dynamic var bought = false
    
    override class func primaryKey() -> String? {
        "id"
    }
}
