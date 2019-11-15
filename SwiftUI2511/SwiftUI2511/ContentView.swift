//
//  ContentView.swift
//  SwiftUI2511
//
//  Created by Namik Catibusic on 27/10/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

class Test : Identifiable {
    var id: UUID = UUID()
    var index: Int
    var scrollOfsset: CGFloat = 0
    
    init(index: Int){
        self.index = index
    }
}

class ViewModel : ObservableObject {
    let items = [Test(index: 0), Test(index: 1), Test(index: 2), Test(index: 3)]
    @Published var scrollOffset: CGFloat = 0
    
    var scrollOffsetChange : CGFloat?  {
        didSet {
            self.scrollOffset = scrollOffsetChange!
            if(self.scrollOffset > CGFloat(items.count * 40) || self.scrollOffset < -CGFloat(items.count * 40)){
                self.scrollOffset = 0
            }
            print(scrollOffset)
        }
        
    }
}

struct ContentView: View {
    @ObservedObject var viewModel : ViewModel = ViewModel()
    
    
    var body: some View {
        NavigationView {
            List(self.viewModel.items) { item in
                GeometryReader { parentGeometry in
                    HStack {
                        ScrollView(.horizontal) {
                            HStack() {
                                GeometryReader { geometry -> Text in
                                    let newOffset = geometry.frame(in: .global).minX
                                    if (self.viewModel.scrollOffset != newOffset) {
                                        self.viewModel.scrollOffsetChange = newOffset
                                    }
                                    
                                    return Text("")
                                }
                                ForEach((1...25), id: \.self) {
                                    Text("\($0)").frame(width: 40, height: 20, alignment: .center)
                                }
                            }
                        }.background(Color.clear)
                        .frame(height: parentGeometry.size.height)
                            .offset(x: self.viewModel.scrollOffset - 20.0, y: 0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyTextPreferenceData {
    let viewIdx: Int
    let bounds: Anchor<CGRect>
}

struct MyTextPreferenceKey: PreferenceKey {
    typealias Value = [MyTextPreferenceData]
    
    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
