//
//  ConversationsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach((0 ... 10), id: \.self) { _ in
                        ConversationCell()
                    }
                }
            }
            
            Button(action: {
                
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
