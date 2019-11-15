//
//  ChatList.swift
//  figmaDesign
//
//  Created by Namik Catibusic on 11/11/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI
struct ChatItemModel : Identifiable {
    var id: UUID = UUID()
    var title: String = ""
    var desc: String = ""
    var imageName: String = ""
}

struct ChatList: View {
    let items : [ChatItemModel] = [
        ChatItemModel(title: "James", desc: "Thank you! That was very helpful!", imageName: "james"),
        ChatItemModel(title: "Will Kenny", desc: "I know... I’m trying to get the funds.", imageName: "willKenny"),
        ChatItemModel(title: "Beth Williams", desc: "I’m looking for tips around capturing the milky way. I have a 6D with a 24-100mm...", imageName: "bethWilliams"),
        ChatItemModel(title: "Rev Shawn", desc: "Wanted to ask if you’re available for a portrait shoot next week.", imageName: "revShawn")]
    
    var body: some View {
        UITableView.appearance().separatorStyle = .none
        UINavigationBar.appearance().barTintColor = .white
        return NavigationView {
            List (items) { item in
                ChatItem(item: item)
            }.padding(.horizontal, -16.0).navigationBarTitle(Text("Charts"), displayMode: .inline)
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
