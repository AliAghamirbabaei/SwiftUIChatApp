//
//  ContentView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil{
                MainTabView()
            }else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
