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
    
    @EnvironmentObject var firebase: FirebaseViewModel
    
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

                        guard let item = firebase.list.first(where: {$0.realmId == items[idx].id}) else {
                            return
                        }
                        firebase.deleteData(todoToDelete: item)
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
                        
                        guard let item = firebase.list.first(where: {$0.realmId == boughtItems[idx].id}) else {
                            return
                        }
                        firebase.deleteData(todoToDelete: item)
                    }
                }
            }
        }
        .refreshable {
            refresh()
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("MobiLab Shopper")
        .onAppear() {
            refresh()
            timerRefresh()
        }
    }
    
    private func timerRefresh() {

        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { timer in
            refresh()
            if shoppingFormPressented {
                timer.invalidate()
            }
        }
    }
    
    private func refresh() {
        
        firebase.getData()
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            DispatchQueue.main.async {
                createRealmItemsFromFirebase()
            }
        }
    }
    
    private func createRealmItemsFromFirebase() {
        for item in firebase.list {
            store.updateItemFromFirestore(realmId: item.realmId, title: item.title, notes: item.notes, quantity: item.quantity, bought: item.bought)
        }
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
            ShoppingFormView(form: ShoppingForm(), firebase: firebase)
                .environmentObject(store)
                .onDisappear {
                    timerRefresh()
                }
        }
    }
}

struct ShoppingItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemListView(
            items: [ShoppingItem(id: 0, title: "title", notes: "notes", bought: false, quantity: 1)],
            boughtItems: [ShoppingItem(id: 1, title: "title", notes: "notes", bought: true, quantity: 8)]
        )
    }
}
