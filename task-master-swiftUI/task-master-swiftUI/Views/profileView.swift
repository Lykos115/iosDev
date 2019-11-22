//MARK: Profile Screen
//  profileView.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 10/31/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

//MARK: Custom Style For Button
struct customStyle: ButtonStyle {
    @State var back = Color.black
    @State var front = Color.white
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color(UIColor.systemBlue):back)
            .foregroundColor(configuration.isPressed ? front:front)
            .cornerRadius(10)
    }
}
struct profileView: View {
    @State private var searchText = ""
    @State private var pressed = true; // invert colors
    @Environment(\.colorScheme) var colorScheme: ColorScheme//for light and dark mode
    @EnvironmentObject var session: FirebaseSession //DB session
    
    var body: some View {
        //MARK: Main vertical stack
        VStack{
            //Search field (remove?)
            VStack{
                TextField("Search", text: $searchText)
                    .background(Color.gray)
                    .cornerRadius(34)
                    .padding(.horizontal, 10)
            }
                .padding()
            
            //Second stack helps visualize
            VStack{
                //For buttons to be next to each other
                HStack{
                    
                    //MARK: IOS like buttons
                    VStack {
                        
                        //Using buttons to start document
                        Button(action:{
                            db.collection("Users").document(self.session.currUser!.uid).setData([
//                                "Display Name": self.session.name!,//name does not persist through app refresh
                                "Homework 1" : [
                                    "Points" : 10,
                                    "Type" : "Homework",
                                    "Added" : "10/22/19",
                                    "Due" : "12/22/19"
                                    
                                ]
                            ]){ err in
                                if let err = err {
                                    print("Error writing document: \(err)")
                                } else {
                                    print("Document successfully written!")
                                }
                            }
                        }){
                            //help visualize
                            VStack{
                                //calendar image and counter(currently text)
                                HStack{
                                    Image(systemName: "calendar")
                                        .padding(.all,8)
                                        .background(Color.accentColor)
                                        .clipShape(Circle())
                                        .padding(.trailing,60)
                                    Text("0")
                                        .bold()
                                        .padding(.leading,20)
                                        .font(.system(size: 25))
                                    
                                }
                                
                                Text("Today")
                                    .bold()
                                    .padding(.trailing, 90)
                                    .padding(.all,6)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.top, 5)
                        }
                        .buttonStyle(customStyle(back: colorScheme == .light ? Color.black : Color(UIColor.systemGray6), front: colorScheme == .light ? Color.white : Color.primary))

                    }
                    
                    //MARK:custom button style
                    Button(action:{
                        
                        // Using button to add to the existing document
                        db.collection("Users").document(self.session.currUser!.uid).setData([
                            "Lab 1":[
                            "Points" : 5,
                            "Type" : "Lab",
                            "Added" : "10/22/19",
                            "Due" : "12/22/19"]], merge: true)
                        
                    }){
                        //help visualize
                        VStack{
                            //calendar image and counter(currently text)
                            HStack{
                                Image(systemName: "calendar")
                                    .padding(.all,8)
                                    .background(pressed ? Color.accentColor : Color.white)
                                    .foregroundColor(pressed ? Color.white : Color.accentColor)
                                    .clipShape(Circle())
                                    .padding(.trailing,60)
                                Text("0")
                                    .bold()
                                    .padding(.leading,20)
                                    .font(.system(size: 25))

                            }

                            Text("Today")
                                .bold()
                                .padding(.trailing, 90)
                                .padding(.all,6)
                                .foregroundColor(pressed ? Color.gray : Color.white)
                        }
                        .padding(.top, 5)
                    }
                    .buttonStyle(customStyle(back: colorScheme == .light ? Color.black : Color(UIColor.systemGray6), front: colorScheme == .light ? Color.white : Color.primary))
                    
                }
                    .padding()
            }
                //MARK:For navigation
                .navigationBarTitle("Profile",displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    self.session.logOut()
                }) {
                    Text("Logout")
                })
            
        }
        .onAppear(perform: getUser)

    }
    func getUser() {
        session.listen()
    }
}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        profileView()
    }
}
