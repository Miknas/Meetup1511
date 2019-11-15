//
//  ListViewPresent.swift
//  1511Present
//
//  Created by Namik Catibusic on 15/11/2019.
//  Copyright © 2019 Namik Catibusic. All rights reserved.
//

import SwiftUI

struct ListViewPresent: View {
    @State private var rect: CGRect = CGRect()
    
    var body: some View {
        List {
            FirstRow()
            SecondRow()
        }
    }
}

struct FirstRow : View {
    var body: some View {
        Text("Title row")
    }
}

struct SecondRow : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Second row").font(.headline)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        }
    }
}

struct ListViewPresent_Previews: PreviewProvider {
    static var previews: some View {
        ListViewPresent()
    }
}
