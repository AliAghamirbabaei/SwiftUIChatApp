//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/14/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                Image("Profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ali Aghamirbabaei")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("@Username")
                        .font(.system(size: 15))
                }
                .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
            
        }
        .padding(.top)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
