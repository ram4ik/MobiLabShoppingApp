//
//  ContentView.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ShoppingStore
    
    var body: some View {
        NavigationView {
            ShoppingItemListView(items: store.items, boughtItems: store.boughtItem)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
