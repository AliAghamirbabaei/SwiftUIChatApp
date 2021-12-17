//
//  ImageUploader.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/18/21.
//

import Firebase
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded image to firestore")
            
            ref.downloadURL { url, error in
                if let error = error {
                    print("DEBUG: Failed get url from firebase with error \(error.localizedDescription)")
                    return
                }
                
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
