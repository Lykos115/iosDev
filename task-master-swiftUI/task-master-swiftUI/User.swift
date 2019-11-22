//
//  User.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 11/14/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import Foundation

class User: ObservableObject {
    
    var uid: String
    var email: String?
    var displayName: String?
    
    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
    

}
