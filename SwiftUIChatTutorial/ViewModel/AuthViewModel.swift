//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/16/21.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    
    func login() {
        
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully registered user with Firebase!")
        }
    }
    
    func uploadProfileImage() {
        
    }
    
    func signout() {
        
    }
}
