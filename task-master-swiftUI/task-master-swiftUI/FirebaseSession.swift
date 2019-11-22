//
//  FirebaseSession.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 11/14/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
//import FirebaseDatabase

class FirebaseSession: ObservableObject {
    
    //MARK: Properties
    @Published var currUser: User?
    @Published var name: String?
    @Published var isLoggedIn: Bool?

//    var ref: DocumentReference? = nil
    
//    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")
//    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")

    
    
    
    //MARK: Functions
    func listen() {
        _ = Auth.auth().addStateDidChangeListener( { (auth, user) in
            if let user = user {
                self.currUser = User(uid: user.uid, displayName: user.displayName, email: user.email)
                self.isLoggedIn = true
            } else {
                self.isLoggedIn = false
                self.currUser = nil
            }
        })
    }
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func logOut() {
            try! Auth.auth().signOut()
            self.isLoggedIn = false
            self.currUser = nil

    }
    
    func signUp(email: String, password: String, test: String, handler: @escaping AuthDataResultCallback) {
        name = test
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        
    }
    
//    func getTODOS() {
//        ref.observe(DataEventType.value) { (snapshot) in
//            self.items = []
//            for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                    let toDo = TODOS(snapshot: snapshot) {
//                    self.items.append(toDo)
//                }
//            }
//        }
//    }
//
//    func uploadTODO(todo: String) {
//        //Generates number going up as time goes on, sets order of TODO's by how old they are.
//        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
//
//        let postRef = ref.child(String(number))
//        let post = TODOS(todo: todo, isComplete: "false")
//        postRef.setValue(post.toAnyObject())
//    }
//
//    func updateTODO(key: String, todo: String, isComplete: String) {
//        let update = ["todo": todo, "isComplete": isComplete]
//        let childUpdate = ["\(key)": update]
//        ref.updateChildValues(childUpdate)
//    }
    

}

