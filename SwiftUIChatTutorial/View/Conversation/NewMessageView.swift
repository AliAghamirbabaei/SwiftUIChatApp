//
//  NewMessageView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/14/21.
//

import SwiftUI

struct NewMessageView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach((0 ... 10), id: \.self) { _ in
                    UserCell()
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
