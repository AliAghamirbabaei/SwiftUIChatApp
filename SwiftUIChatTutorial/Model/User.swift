//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/18/21.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER = User(id: "1234567889765645433", username: "@Text", fullname: "Test Test", email: "Test@Gmail.com", profileImageUrl: "www.google.com")
