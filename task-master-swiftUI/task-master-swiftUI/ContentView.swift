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
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .padding(.horizontal, 100)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
}

struct ContentView: View {

    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        
        NavigationView{
            if session.currUser != nil {
                profileView()
                
            }else{
                logInView()
            }
        }
        .onAppear(perform: getUser)
        
    }
    
    func getUser() {
        session.listen()
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
