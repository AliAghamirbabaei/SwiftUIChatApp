//
//  EditProfileView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/13/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                // header
                
                VStack {
                    // photo / edit button / text
                    HStack {
                        // photo / edit button
                        VStack {
                            
                        }
                    }
                }
                
                // status
                VStack {
                    // status text
                    
                    // status
                    HStack {
                        Text("At the movies")
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
