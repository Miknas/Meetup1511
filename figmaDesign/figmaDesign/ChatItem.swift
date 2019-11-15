//
//  ChatItem.swift
//  figmaDesign
//
//  Created by Namik Catibusic on 10/11/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct ChatItem: View {
    var item: ChatItemModel
    var body: some View {
        VStack (alignment: .leading, spacing: 0, content: {
            HStack(alignment: .top) {
                Image(item.imageName).resizable().clipShape(Circle()).frame(width: 64, height: 64, alignment: Alignment.center)
                VStack(alignment: .leading) {
                    Text(item.title).font(Font.system(size: 13).bold())
                        
                        
                    Text(item.desc).font(Font.system(size: 13)).padding([.top], 6)
                }
                .padding(.leading, 16.0)
                
            }
            .padding([.top, .leading, .trailing], 16.0)
            Divider()
                .padding(.top, 20.0)
                
        })
    }
}

struct ChatItem_Previews: PreviewProvider {
    static var previews: some View {
        ChatItem(item: ChatItemModel(title: "Test", desc: "Test", imageName: "userImage"))
    }
}
