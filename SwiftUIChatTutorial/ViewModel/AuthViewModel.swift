//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/16/21.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthenticateUser = false
    private var tempCurrectUser: FirebaseAuth.User?
    
    func login() {
        
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempCurrectUser = user
            
            let data: [String: Any] = [
                "email": email,
                "password": password,
                "username": username,
                "fullname": fullname
            ]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload user data with error: \(error.localizedDescription)")
                }
                
                self.didAuthenticateUser = true
                print("DEBUG: Successfully upload user data with Firebase!")
            }
            
            print("DEBUG: Successfully registered user with Firebase!")
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempCurrectUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imageURL in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageUrl": imageURL]) { _ in
                print("DEBUG: Succesfully updated user data")
            }
        }
    }
    
    func signout() {
        
    }
}
