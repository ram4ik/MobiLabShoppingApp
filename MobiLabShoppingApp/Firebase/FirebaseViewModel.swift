//
//  ViewModel.swift
//  MobiLabShoppingApp
//
//  Created by ramil on 26.02.2022.
//

import Firebase
import FirebaseAnalytics
import FirebaseCore
import FirebaseStorage
import Foundation
import FirebaseDatabase
import FirebaseFirestore

class FirebaseViewModel: ObservableObject {
    
    @Published var list = [Todo]()
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("todos").getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {

                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return Todo(id: d.documentID,
                                        realmId: d["realmId"] as? Int ?? 0,
                                        title: d["title"] as? String ?? "",
                                        notes: d["notes"] as? String ?? "",
                                        quantity: d["quantity"] as? Int ?? 0,
                                        bought: d["bought"] as? Bool ?? false)
                        }
                    }
                }
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func addData(realmId: Int, title: String, notes: String, quantity: Int, bought: Bool) {
        let db = Firestore.firestore()
        db.collection("todos").addDocument(data: [
            "realmId" : realmId,
            "title" : title,
            "notes" : notes,
            "quantity" : quantity,
            "bought" : bought
        ]) { error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func deleteData(todoToDelete: Todo) {
        let db = Firestore.firestore()
        db.collection("todos").document(todoToDelete.id).delete { error in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func updateData(todoToUpdate: Todo) {
        let db = Firestore.firestore()
        db.collection("todos").document(todoToUpdate.id).setData([
            "realmId" : todoToUpdate.realmId,
            "title" : todoToUpdate.title,
            "notes" : todoToUpdate.notes,
            "quantity" : todoToUpdate.quantity,
            "bought" : true
        ], merge: true)
    }
    
}
