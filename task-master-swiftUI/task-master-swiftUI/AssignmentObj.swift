//
//  AssignmentObj.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 11/10/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI

struct AssignmentObj: Hashable, Codable {
    var category: Int
    var points: Int
    
//    var assigned: Date
//    var due: Date
//    var timeDue: Date //Unsure if needed
    
    var title: String
    var grade: String
    var course: String
    
}

//struct AssignmentObj_Previews: PreviewProvider {
//    static var previews: some View {
//        AssignmentObj()
//    }
//}
