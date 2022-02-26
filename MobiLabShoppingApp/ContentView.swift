//
//  ContentView.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ShoppingStore
    @EnvironmentObject var firebase: FirebaseViewModel
    
    var body: some View {
        NavigationView {
            ShoppingItemListView(items: store.items, boughtItems: store.boughtItem, firebase: _firebase)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
