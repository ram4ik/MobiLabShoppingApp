//
//  RealmPersistence.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import Foundation
import RealmSwift

class RealmPersistence {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            fatalError("Failed to open Realm error: \(err.localizedDescription)")
        }
    }
}
