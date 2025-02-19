//
//  TabViewExample.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct TabViewExample: View {
    @SceneStorage("selectedTab")
    private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home View")
                .tabItem { Text("Home") }
                .tag(0)
            Text("Profile View")
                .tabItem { Text("Profile") }
                .tag(1)
        }
    }
}

#Preview {
    TabViewExample()
}
