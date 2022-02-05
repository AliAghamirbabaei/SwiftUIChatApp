//
//  Constants.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/18/21.
//

import Firebase

struct Constants {
    static let COLLECTION_USERS = Firestore.firestore().collection("users")
    static let COLLECTION_MESSAGES = Firestore.firestore().collection("messages")
}
