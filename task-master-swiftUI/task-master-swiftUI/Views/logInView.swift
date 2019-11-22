//
//  logIn.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 11/19/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI

struct logInView: View {
    @State var username: String = ""
    @State var password: String = ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        VStack{
            Image("checklist")
                .resizable()
                .frame(width:100, height: 100)
                .padding()
            
            TextField("Username",text: $username){
                UIApplication.shared.endEditing()
            }
            .modifier(logInStyle())
            
            SecureField("Password",text: $password){
                UIApplication.shared.endEditing()
            }
            .modifier(logInStyle())
            
            Button(action: logIn){
                Text("Log In")
                    .background(colorScheme == .light ? Color.black : Color.white)
                    .border(colorScheme == .light ? Color.black : Color.white)
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .padding(10)
                    .border(colorScheme == .light ? Color.black : Color.white, width: 10)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(colorScheme == .light ? Color.black : Color.white, lineWidth: 5)
                )
            }
            
            NavigationLink(destination: signUp()){
                Text("Don't have an account? ")
                    .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                Text("Sign Up")
            }
            .padding()
        }
        //MARK: Navigation Buttons
        .navigationBarTitle("Log In",displayMode: .inline)
        .navigationBarItems(trailing:
            NavigationLink(destination: skipLogIn()) {
                Text("Skip")
        })
    }
    
    //MARK: Functions
    func logIn() {
        session.logIn(email: username, password: password) { (result, error) in
            if error != nil {
                print("Error")
            } else {
                self.username = ""
                self.password = ""
            }
        }
    }
}

struct logIn_Previews: PreviewProvider {
    static var previews: some View {
        logInView()
    }
}
