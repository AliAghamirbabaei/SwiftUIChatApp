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
    @Published var userSession: FirebaseAuth.User?
    @Published var currectUser: User?
    private var tempCurrectUser: FirebaseAuth.User?
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error: \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
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
                "username": username,
                "fullname": fullname
            ]
            
            Constants.COLLECTION_USERS.document(user.uid).setData(data) { error in
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
            Constants.COLLECTION_USERS.document(uid).updateData(["profileImageUrl": imageURL]) { _ in
                self.userSession = self.tempCurrectUser
                print("DEBUG: Succesfully updated user data")
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        Constants.COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currectUser = user
        }
    }
}
