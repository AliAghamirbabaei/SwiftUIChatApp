//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/18/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}
