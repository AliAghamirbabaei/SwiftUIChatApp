//
//  ChatView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI
import Kingfisher

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
            Color("Background")
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    KFImage(URL(string: viewModel.user.profileImageUrl))
                                    .fade(duration: 0.25)
                                    .cacheMemoryOnly()
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .padding(.leading, 40)
            )
            .padding(.vertical)
        }
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
