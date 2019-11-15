//
//  ContentView.swift
//  1511Present
//
//  Created by Namik Catibusic on 10/11/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = "Test"
    var body: some View {
        VStack {
            Text("Hello, World!")
                .background(Color.red)
                .padding(10)
                .background(Color.yellow)
                .foregroundColor(Color.green)
        
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Divider().frame(height: 11.0).background(Color.red).frame( height: 20, alignment: Alignment.bottom)
            Text("Heellloooo").italic() + Text(" World").font(.custom("Verdana-Bold", size: 25)).foregroundColor(Color.green)
            
            Text("Tappable").font(.custom("ChalkboardSE-Bold", size: 20)).onTapGesture {
                print("Nesto kao sarma")
            }
            TextField("This is placeholder", text: $name).padding(20).textFieldStyle(RoundedBorderTextFieldStyle()).font(Font.system(size: 20.0))
            Image(systemName: "star.fill").resizable().frame(width: 50.0, height: 50.0).shadow(radius: /*@START_MENU_TOKEN@*/16/*@END_MENU_TOKEN@*/).border(Color.purple, width: 1.0)
            
            
            //.cornerRadius(15)
            Image(systemName: "star.fill").resizable().frame(width: 50.0, height: 50.0).background(Color.yellow).border(Color.purple, width: 5)
            
            Image(systemName: "star.fill").resizable().frame(width: 50.0, height: 50.0).background(Color.yellow).cornerRadius(20).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.purple, lineWidth: 5)
                )
            
            
            //stop HERE!!!!
           // AnimationExample().overlay(Text("Loading"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
