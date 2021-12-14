//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/14/21.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "Hi Ali"),
            .init(isFromCurrentUser: false, messageText: "Hi John"),
            .init(isFromCurrentUser: true, messageText: "What are you doin?"),
            .init(isFromCurrentUser: false, messageText: "Just Chatting with you."),
            .init(isFromCurrentUser: true, messageText: "And you?"),
            .init(isFromCurrentUser: false, messageText: "Nothing."),
        ]
    }
    
    func sendMessage(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
}
