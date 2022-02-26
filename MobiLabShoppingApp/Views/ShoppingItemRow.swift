//
//  ShoppingItemRow.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI

struct ShoppingItemRow: View {
    @EnvironmentObject var store: ShoppingStore
    @State private var shoppingFormPresented = false
    let shoppingItem: ShoppingItem
    
    @EnvironmentObject var firestore: FirebaseViewModel
    
    var body: some View {
        HStack {
            Button {
                openUpdate()
            } label: {
                Text("\(shoppingItem.quantity)")
                    .bold()
                    .padding(.horizontal, 4)
                
                VStack(alignment: .leading) {
                    Text(shoppingItem.title)
                        .font(.headline)
                    
                    Text(shoppingItem.notes)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $shoppingFormPresented) {
                ShoppingFormView(form: ShoppingForm(self.shoppingItem), firebase: firestore)
                    .environmentObject(self.store)
            }
            Spacer()
            Button {
                buyItem()
            } label: {
                Circle()
                    .fill(shoppingItem.bought ? Color.green : Color.orange)
                    .frame(width: 20, height: 20)
            }.accessibilityLabel("DoneButton")
        }
    }
}

// MARK: - Actions
extension ShoppingItemRow {
    func openUpdate() {
        if !shoppingItem.bought {
            shoppingFormPresented.toggle()
        }
    }
    
    func buyItem() {
        withAnimation {
            if !shoppingItem.bought {
                store.updateBuy(shoppingItem: shoppingItem)
                
                guard let item = firestore.list.first(where: { $0.realmId == shoppingItem.id}) else {
                    print("UPS! you are here!")
                    return
                }
                firestore.updateData(todoToUpdate: item)
            }
        }
    }
}

struct ShoppingItemRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShoppingItemRow(
                shoppingItem: ShoppingItem(id: 3, title: "Coconuts", notes: "No notes", bought: false, quantity: 9)
            )
            ShoppingItemRow(
                shoppingItem: ShoppingItem(id: 3, title: "Coconuts", notes: "No notes", bought: true, quantity: 9)
            )
                .preferredColorScheme(.dark)
        }
    }
}
