//
//  UploadView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-19.
//

import SwiftUI

struct UploadView: View {
    
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named:"miseenplacelogo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var showAddRecipeView: Bool = false
    
    var body: some View {
        VStack{
            
            Button(action: {
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    sourceType = UIImagePickerController.SourceType.camera
                    showImagePicker.toggle()
                } else {
                    print("Device has no camera, please choose picture from photo library")
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                }
                
                
            }) {
                Image(systemName: "camera")//uiImage: imageChosen)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height:300, alignment: .center)
                    .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
                
            }
            .sheet(isPresented: $showImagePicker, onDismiss: segueToAddRecipesView, content: {
                ImagePicker(imageSeleceted: $imageSelected, sourceType: $sourceType)
            })
            Divider()
            
            Button(action: {
                sourceType = UIImagePickerController.SourceType.photoLibrary
                showImagePicker.toggle()
            }) {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .leading)
                    .foregroundColor(Color(red: 0.00, green: 0.38, blue: 0.40))
            }.fullScreenCover(isPresented: $showAddRecipeView, content: {
                AddRecipesView(imageSelected: $imageSelected)
            })
        }
        
    }
    
    func segueToAddRecipesView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            showAddRecipeView.toggle()
        }
        
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}

