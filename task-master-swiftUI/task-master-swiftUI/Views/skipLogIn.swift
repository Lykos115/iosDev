//MARK: Profile Screen
//  skipLogIn.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 10/31/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI


struct skipLogIn: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var assignmentList = [
        AssignmentObj(category: 1, points: 20, title: "Lab 1", grade: "A", course: "CST-200"),
        AssignmentObj(category: 2, points: 25, title: "Lab 2", grade: "B", course: "CST-201"),
        AssignmentObj(category: 3, points: 30, title: "Lab 3", grade: "C", course: "CST-202"),
        AssignmentObj(category: 4, points: 35, title: "Lab 4", grade: "B", course: "CST-203"),
        AssignmentObj(category: 5, points: 40, title: "Lab 5", grade: "A", course: "CST-204"),
    ]
    var body: some View {
        VStack {
            List(assignmentList, id: \.title){ it in
                HStack{
                    Text(it.course)
                    Text(it.grade)
                    Text(it.title)
                    Text(String(it.points))
                    Text(String(it.category))
                }
            }
            .navigationBarTitle("Assignment")
            Spacer()
            HStack{
                NavigationLink(destination:createAssignments()){
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 40, height: 35)
                        .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                        .padding(.bottom, 7)
                        .background(colorScheme == .light ? Color.black : Color.white)
                        .cornerRadius(38.5)
                        .padding()
                }
                Spacer()
            }
        }
    }
}

struct skipLogIn_Previews: PreviewProvider {
    static var previews: some View {
//        skipLogIn()
        Group {
           skipLogIn()
              .environment(\.colorScheme, .light)

           skipLogIn()
              .environment(\.colorScheme, .dark)
        }
    }
}
