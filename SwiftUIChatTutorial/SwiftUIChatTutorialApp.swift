//
//  SwiftUIChatTutorialApp.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/12/21.
//

import SwiftUI
import Firebase

@main
struct SwiftUIChatTutorialApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(AuthViewModel())
        }
    }
}
