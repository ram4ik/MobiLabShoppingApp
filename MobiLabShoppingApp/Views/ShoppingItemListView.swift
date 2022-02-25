//
//  ShoppingItemListView.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI

struct ShoppingItemListView: View {
    @EnvironmentObject var store: ShoppingStore
    @State private var shoppingFormPressented = false
    let items: [ShoppingItem]
    let boughtItems: [ShoppingItem]
    
    var body: some View {
        List {
            Section(header: Text("Items to shop")) {
                if items.isEmpty {
                    Text("Add some shopping items before you go to grocery shopping")
                        .foregroundColor(.gray)
                }
                ForEach(items) { item in
                    ShoppingItemRow(shoppingItem: item)
                }.onDelete { indexSet in
                    if let idx = indexSet.first {
                        store.delete(itemId: items[idx].id)
                    }
                }

                newItemButton
            }
            
            Section(header: Text("Already in cart")) {
                if boughtItems.isEmpty {
                    Text("Buy something and it will show up here")
                }
                ForEach(boughtItems) { item in
                    ShoppingItemRow(shoppingItem: item)
                }.onDelete { indexSet in
                    if let idx = indexSet.first {
                        store.deleteBought(itemId: boughtItems[idx].id)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
        .navigationBarTitle("MobiLab Shopper")
    }
    
    var newItemButton: some View {
        Button {
            shoppingFormPressented.toggle()
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text("Add New Item")
                    .bold()
            }
        }
        .foregroundColor(.orange)
        .sheet(isPresented: $shoppingFormPressented) {
            ShoppingFormView(form: ShoppingForm())
                .environmentObject(store)
        }
    }
}

struct ShoppingItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemListView(
            items: [ShoppingItem(id: 0, title: "title", notes: "notes", bought: false, quantity: 1)],
            boughtItems: [ShoppingItem(id: 1, title: "title2", notes: "other notes", bought: true, quantity: 2)]
        )
    }
}
