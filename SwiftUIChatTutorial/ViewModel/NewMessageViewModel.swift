//
//  NewMessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/18/21.
//

import Firebase

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        Constants.COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({
                try? $0.data(as: User.self)
            }).filter({$0.id != AuthViewModel.shared.userSession?.uid})
        }
    }
}
