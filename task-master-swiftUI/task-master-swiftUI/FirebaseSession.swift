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

class FirebaseSession: ObservableObject {
    
    //MARK: Properties
    @Published var currUser: User?
    @Published var displayName: String?
    @Published var isLoggedIn: Bool?


    
    //MARK: Functions
    func listen() {
        _ = Auth.auth().addStateDidChangeListener( { (auth, user) in
            if let user = user {
                self.currUser = User(uid: user.uid, displayName: self.displayName, email: user.email)
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
    
    func signUp(email: String, password: String, display: String, handler: @escaping AuthDataResultCallback) {//test: String,
        self.displayName = display
        print(self.displayName)
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        
    }
    
}

