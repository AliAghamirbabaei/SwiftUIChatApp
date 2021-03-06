//
//  SettingsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI
import AlertToast

struct SettingsView: View {
    private let user: User
    @State private var showToast = false
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack{
            Color("SettingBackground")
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                NavigationLink(destination: EditProfileView(), label: {
                    SettingsHeaderView(user: user)
                })
                            
                VStack(spacing: 1) {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { ViewModel in
                        SettingsCell(viewModel: ViewModel)
                    }
                }
                
                Button(action: {
                    showToast.toggle()
                    
                    AuthViewModel.shared.signout()
                }, label: {
                    Text("Log out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color("Primary"))
                })
                
                Spacer()
            }
        }
        .toast(isPresenting: $showToast, duration: 0.0){
            AlertToast(type: .loading, title: "Signing in...")
        }
    }
}
