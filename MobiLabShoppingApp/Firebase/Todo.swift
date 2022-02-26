//
//  Todo.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 26.02.2022.
//

import Foundation

struct Todo: Identifiable {
    
    var id: String
    var realmId: Int
    var title: String
    var notes: String
    var quantity: Int
    var bought: Bool
    
}
