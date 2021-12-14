//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/14/21.
//

import Foundation

struct Message: Identifiable {
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
    
}
