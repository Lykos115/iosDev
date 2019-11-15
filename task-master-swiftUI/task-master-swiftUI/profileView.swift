//MARK: Profile Screen
//  profileView.swift
//  task-master-swiftUI
//
//  Created by Lykøs on 10/31/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI

//MARK: Button Testing
struct SendButton: View {
    let action: () -> ()
    let isDisabled: Bool
    
    var body: some View {
        Button(action:{}){//self.pressed = true
            //help visualize
            VStack{
                //calendar image and counter(currently text)
                HStack{
                    Image(systemName: "calendar")
                        .padding(.all,8)
                        .background(isDisabled ? Color.accentColor : Color.white)
                        .foregroundColor(isDisabled ? Color.white : Color.accentColor)
                        .clipShape(Circle())
                        .padding(.trailing,60)
                    //                                .onTapGesture {
                    //                                    self.pressed = false
                    //                                }
                    Text("0")
                        .bold()
                        .padding(.leading,20)
                        .font(.system(size: 25))
                    
                }
                
                Text("Today")
                    .bold()
                    .padding(.trailing, 90)
                    .padding(.all,6)
                    .foregroundColor(isDisabled ? Color.gray : Color.white)
                //                                .foregroundColor(Color.gray)
            }
            .padding(.top, 5)
        }
    }
}



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
                .padding()//.vertical,-400 <- currently not important
            
            //Second stack helps visualize
            VStack{
                //For buttons to be next to each other
                HStack{
                    
                    //MARK: IOS like buttons
                    Button(action:{}){
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
                    
                    //MARK:custom button style
                    Button(action:{self.pressed.toggle()}){//self.pressed = true
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
                                //                                .onTapGesture {
                                //                                    self.pressed = false
                                //                                }
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
                            //                                .foregroundColor(Color.gray)
                        }
                        .padding(.top, 5)
                    }
//                    SendButton(action: {}, isDisabled: false)//testing
                    .buttonStyle(customStyle(back: colorScheme == .light ? Color.black : Color(UIColor.systemGray6), front: colorScheme == .light ? Color.white : Color.primary))
                    
                }
                    .padding()//.vertical,-250 <- currently not important
            }
                //MARK:For navigation
                .navigationBarTitle("Profile",displayMode: .inline)
                .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        profileView()
    }
}
