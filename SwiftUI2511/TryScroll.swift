////
////  TryScroll.swift
////  SwiftUI2511
////
////  Created by Namik Catibusic on 29/10/2019.
////  Copyright © 2019 Namik Catibusic. All rights reserved.
////
//
//import SwiftUI
//
//struct WrapperView: View {
//
//    @State var index: Int = 0
//
//    var body: some View {
//        VStack {
//            SwiftUIPagerView(index: $index, pages: (0...4).map { index in Text("\(index + 1)", id: \.self) })
//
//            Picker(selection: self.$index.animation(.easeInOut), label: Text("")) {
//                ForEach(0..<4) { page in Text("\(page + 1)").tag(page) }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding()
//        }
//    }
//}
//
//struct SwiftUIPagerView<Content: View & Identifiable>: View {
//
//    @Binding var index: Int
//    @State private var offset: CGFloat = 0
//    @State private var isGestureActive: Bool = false
//
//    // 1
//    var pages: [Content]
//
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(alignment: .center, spacing: 0) {
//                    ForEach(self.pages) { page in
//                        page
//                            .frame(width: geometry.size.width, height: nil)
//                    }
//                }
//            }
//            // 2
//            .content.offset(x: self.isGestureActive ? self.offset : -geometry.size.width * CGFloat(self.index))
//            // 3
//            .frame(width: geometry.size.width, height: nil, alignment: .leading)
//            .gesture(DragGesture().onChanged({ value in
//                // 4
//                self.isGestureActive = true
//                // 5
//                self.offset = value.translation.width + -geometry.size.width * CGFloat(self.index)
//            }).onEnded({ value in
//                if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.pages.endIndex - 1 {
//                    self.index += 1
//                }
//                if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
//                    self.index -= 1
//                }
//                // 6
//                withAnimation { self.offset = -geometry.size.width * CGFloat(self.index) }
//                // 7
//                DispatchQueue.main.async { self.isGestureActive = false }
//            }))
//        }
//    }
//}
