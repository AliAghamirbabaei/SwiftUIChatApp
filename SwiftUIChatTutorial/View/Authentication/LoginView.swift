//
//  LoginView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack { Spacer() }
                
                Text("Hello.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                Spacer()
            }
            .padding(.leading)
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
