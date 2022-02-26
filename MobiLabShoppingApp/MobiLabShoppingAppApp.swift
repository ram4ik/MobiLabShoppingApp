//
//  MobiLabShoppingAppApp.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI
import Firebase

@main
struct MobiLabShoppingAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ShoppingStore(realm: RealmPersistence.initializer()))
        }
    }
}
