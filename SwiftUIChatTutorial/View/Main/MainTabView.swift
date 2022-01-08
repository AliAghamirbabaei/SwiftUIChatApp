//
//  MainTabView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI
import AlertToast

struct MainTabView: View {
    @State private var showToast = false
    @State private var selectedIndex = 0
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currectUser {
            NavigationView {
                // tab view
                TabView(selection: $selectedIndex) {
                    ConversationsView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem{
                            VStack {
                                Image(systemName: "bubble.left")
                                Text("Chats")
                                    .foregroundColor(Color("Label"))
                                    .padding()
                            }
                        }
                        .tag(0)
                    
                    SettingsView(user: user)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem{
                            VStack {
                                Image(systemName: "gear")
                                Text("Setting")
                                    .foregroundColor(Color("Label"))
                                    .padding()
                            }
                        }
                        .tag(1)
                }
                .navigationTitle(tabTitle)
                
            }
            .onAppear(perform: {
                showToast = true
            })
            .toast(isPresenting: $showToast, duration: 3.0){
                AlertToast(displayMode: .hud, type: .complete(.green), title: "Signed in")
            }
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Settings"
        default: return ""
        }
    }
}
