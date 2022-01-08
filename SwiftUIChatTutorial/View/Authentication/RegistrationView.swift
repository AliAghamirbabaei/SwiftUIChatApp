//
//  RegistrationView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI
import AlertToast

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var showToast = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser, label: {})
            
            VStack(alignment: .leading, spacing: 12) {
                HStack { Spacer() }
                
                Text("Get started.")
                    .font(.largeTitle)
                    .bold()
                
                Text("Creat your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 20) {
                    CustomTextField(imageName: "person",
                                    placeholderText: "Fullname",
                                    isSecureField: false,
                                    text: $fullname)
                    
                    CustomTextField(imageName: "person",
                                    placeholderText: "Username",
                                    isSecureField: false,
                                    text: $username)
                    
                    CustomTextField(imageName: "envelope",
                                    placeholderText: "Email",
                                    isSecureField: false,
                                    text: $email)
                    
                    CustomTextField(imageName: "lock",
                                    placeholderText: "Password",
                                    isSecureField: true,
                                    text: $password)
                }
                .padding([.top, .horizontal], 32)
                
            }
            .padding(.leading)
            
            Button(action: {
                showToast.toggle()
                
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(email == "" || password == "" || username == "" || fullname == "" ? Color("DisabledButton") : Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
                .padding(.top, 24)
                .shadow(color: Color("Shadow"), radius: 10, x: 0.0, y: 0.0)
            
            Spacer()
            
            Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
            })
                .padding(.bottom, 32)
        }
        .toast(isPresenting: $showToast, duration: 0.0){
            AlertToast(type: .loading, title: "Signing up...")
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
