//
//  ContentView.swift
//  swiftUItutorial
//
//  Created by Lykøs on 10/24/19.
//  Copyright © 2019 Lykøs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Wøłf Päck")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Text("He cried wolf")
                    .font(.subheadline)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
