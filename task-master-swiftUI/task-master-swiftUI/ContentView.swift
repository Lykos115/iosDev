//MARK: Log In
//  ContentView.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 10/30/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI

//MARK: Hide Keyboard On Return
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//MARK: Custom Style Log In Textfield
struct logInStyle: ViewModifier {
//    @Environment(\.colorScheme) var colorScheme: ColorScheme
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
//            .padding(.vertical,10)
            .padding(.horizontal, 100)
            .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
            
    }
}

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        NavigationView{
                
            VStack{
                Image("checklist")
                    .resizable()
                    .frame(width:100, height: 100)
//                    .padding(.bottom,20)
                    .padding()
                
                TextField("Username",text: $username){
                    UIApplication.shared.endEditing()
                }
                .modifier(logInStyle())
                
                SecureField("Password",text: $password){
                    UIApplication.shared.endEditing()
                }
                .modifier(logInStyle())
                NavigationLink(destination: profileView()){
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
//                Button(action:{
//                    print("tapped")
//                }){
//                    Text("Log In")
//                    .background(colorScheme == .light ? Color.black : Color.white)
//                        .border(colorScheme == .light ? Color.black : Color.white)
//                        .foregroundColor(colorScheme == .light ? .white : .black)
//                        .padding(10)
//                        .border(colorScheme == .light ? Color.black : Color.white, width: 10)
//                        .cornerRadius(40)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 40)
//                            .stroke(colorScheme == .light ? Color.black : Color.white, lineWidth: 5)
//                    )
//                }
            }
            //MARK: Navigation Buttons
            .navigationBarTitle("Log In",displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: skipLogIn()) {
                    Text("Skip")
                })
        }
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           ContentView()
              .environment(\.colorScheme, .light)

           ContentView()
              .environment(\.colorScheme, .dark)
        }
//        ContentView()
    }
}
