//
//  ContentView.swift
//  figmaDesign
//
//  Created by Namik Catibusic on 10/11/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI
import Combine

class MainTabBarData: ObservableObject {

    /// This is the index of the item that fires a custom action
    let customActionteminidex: Int

    let objectWillChange = PassthroughSubject<MainTabBarData, Never>()

    var itemSelected: Int {
        didSet {
            if itemSelected == customActionteminidex {
                itemSelected = oldValue
                isCustomItemSelected = true
            }
            objectWillChange.send(self)
        }
    }

    /// This is true when the user has selected the Item with the custom action
    var isCustomItemSelected: Bool = false

    init(initialIndex: Int = 2, customItemIndex: Int) {
        self.customActionteminidex = customItemIndex
        self.itemSelected = initialIndex
    }
}


struct ContentView: View {
    @ObservedObject private var tabData = MainTabBarData(initialIndex: 1, customItemIndex: 2)


    var body: some View {
        UITabBar.appearance().barTintColor = .white
        return TabView (selection: $tabData.itemSelected) {

            ChatList()
                .tabItem {
                    VStack {
                        Image("homeIcon")
                    }
                    
                }.tag(1)
            
            Text("Second Section!").tabItem {
                Image("search")
            
            }.tag(2)

            Text("Custom Action")
                .tabItem {
                    VStack(spacing: 20.0) {
                        Image("special").frame(width: 10, height: 10, alignment: .center)
                    }
                    
                }
                .tag(3)

            Text("Third Section!")
                .tabItem {
                    Image("comment")
                
                }.tag(4)
           
            Text("Third Section!")
                .tabItem {
                    Image("profile")
                
                }.tag(5)

            }
            .padding(.bottom, -0.0)
            .frame(height: nil)
            .font(.headline)
            .sheet(isPresented: $tabData.isCustomItemSelected, onDismiss: {
                print("dismiss")
            }) {
                Text("Custom action modal")
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
