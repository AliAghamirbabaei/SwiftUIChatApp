//
//  ChatView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea()
            VStack {
                // messages
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach((viewModel.messages)) { message in
                            MessageView(viewModel: MessageViewModel(message))
                        }
                    }
                }
                
                CustomInputView(text: $messageText, action: sendMessage)
            }
            .navigationTitle(user.fullname)
            //.navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
        }
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
