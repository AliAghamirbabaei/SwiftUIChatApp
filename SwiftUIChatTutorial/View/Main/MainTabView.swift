//
//  MainTabView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            // tab view
            TabView{
                ConversationsView()
                    .tabItem{
                        Image(systemName: "bubble.left")
                    }
                
                ChannelsView()
                    .tabItem{
                        Image(systemName: "bubble.left.and.bubble.right")
                    }
                
                SettingsView()
                    .tabItem{
                        Image(systemName: "gear")
                    }
            }
            // each view for tab like channel chats and settings
            Text("Hello, World!")
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
