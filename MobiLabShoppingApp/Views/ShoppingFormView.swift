//
//  ShoppingFormView.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 25.02.2022.
//

import SwiftUI

struct ShoppingFormView: View {
    @EnvironmentObject var store: ShoppingStore
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: ShoppingForm
    let quantityOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    @ObservedObject var firebase = FirebaseViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $form.title)
                
                Picker(selection: $form.quantity, label: Text("Quantity")) {
                    ForEach(quantityOptions, id: \.self) { option in
                        Text("\(option)")
                            .tag(option)
                    }
                }
                
                Section(header: Text("Notes")) {
                    TextField("", text: $form.notes)
                }
            }
            .navigationBarTitle("Shopping Form", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel", action: dismiss), trailing: Button(form.updating ? "Update" : "Save", action: save))
        }
    }
}

// MARK: - Actions
extension ShoppingFormView {
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func save() {
        if form.updating, let id = form.shoppingItemId {
            store.updateItem(itemId: id, title: form.title, notes: form.notes, quantity: form.quantity)
        } else {
            let id = store.create(title: form.title, notes: form.notes, quantity: form.quantity)
            firebase.addData(realmId: id, title: form.title, notes: form.notes, quantity: form.quantity, bought: form.updating)
        }
        
        dismiss()
    }
}

struct ShoppingFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShoppingFormView(form: ShoppingForm(ShoppingItem(id: 5, title: "Add new", notes: "Without any notes", bought: false, quantity: 6)))
            ShoppingFormView(form: ShoppingForm(ShoppingItem(id: 6, title: "Add new in Dark", notes: "Without any notes", bought: true, quantity: 7)))
                .preferredColorScheme(.dark)
        }
    }
}

