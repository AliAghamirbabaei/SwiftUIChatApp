//
//  ProfilePhotoSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/17/21.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage = UIImage()
    @State private var isUserSelectedImage = false
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                imagePickerPresented = true
                print("image picker presented")
                print(selectedImage)
            }, label: {
                if isUserSelectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.black)
                }
            })
            
            Text(isUserSelectedImage == false ? "Select a profile photo" : "Great! Tap below to continue")
                .font(.system(size: 20, weight: .semibold))
            
            if isUserSelectedImage {
                Button(action: {
                    viewModel.uploadProfileImage()
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 24)
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $imagePickerPresented, onDismiss: {
            if selectedImage.size.width == 0 {
                isUserSelectedImage.toggle()
            }
        }) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
        }
    }
    
//    func loadImage() {
//        guard let selectedImage = selectedImage else { return }
//        print("Load Image Func")
//        profileImage = Image(uiImage: selectedImage)
//        print("loaded image")
//    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
