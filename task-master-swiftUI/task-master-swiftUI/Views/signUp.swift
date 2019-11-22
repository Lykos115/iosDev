//
//  signUp.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 11/18/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI
struct signUpMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
    }
}

struct signUp: View {
    @State var firstName: String = ""//currently not useed
    @State var lastName: String = ""//currently not used
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var session: FirebaseSession
    
    
    var body: some View {
        VStack{
            HStack{
                TextField("First Name",text: $firstName){
                    UIApplication.shared.endEditing()
                }
                .padding()
                TextField("Last Name",text: $lastName){
                    UIApplication.shared.endEditing()
                }
            }
            .modifier(signUpMod())
            VStack{
                TextField("Email",text: $email){
                    UIApplication.shared.endEditing()
                }
                SecureField("Password",text: $password){
                    UIApplication.shared.endEditing()
                }
                SecureField("Confirm Password",text: $confirmPassword){
                    UIApplication.shared.endEditing()
                }
            }
            .modifier(signUpMod())
            
            Button(action: {
                if(self.password == self.confirmPassword){
                    self.signUp(display: self.firstName)
                }else{
                    print("Passwords do not match")
                }
            }){
                Text("Sign Up")
                    .background(Color.black)
                    .border(Color.black)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(Color.black, width: 10)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.black, lineWidth: 5)
                    )
            }
        }
    }

    func signUp(display: String) {
        if !email.isEmpty && !password.isEmpty {
            session.signUp(email: email, password: password, test: display) { (result, error) in
                if error != nil {
                    print(error)
                } else {
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }
    
    
    
}

struct signUp_Previews: PreviewProvider {
    static var previews: some View {
        signUp()
    }
}
