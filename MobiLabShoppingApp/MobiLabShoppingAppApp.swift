//
//  MobiLabShoppingAppApp.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI

@main
struct MobiLabShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShoppingStore(realm: RealmPersistence.initializer()))
        }
    }
}
