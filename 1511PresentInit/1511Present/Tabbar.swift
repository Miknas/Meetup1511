//
//  Tabbar.swift
//  1511Present
//
//  Created by Namik Catibusic on 10/11/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    VStack{
                        Text("First").offset(x: 0, y: 30)
                        //Image(systemName: "1.circle")
                    }
                }.tag(0)
            ListViewPresent()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
            }.tag(1).onTapGesture {
                print("selected")
            }
        }
        
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
