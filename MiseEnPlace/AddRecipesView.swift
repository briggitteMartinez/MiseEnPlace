//
//  AddRecipesView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-16.
//
import UIKit
import SwiftUI

struct AddRecipesView: View {
    @State var title = ""
    @State var inputText = ""
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named:"miseenplacelogo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        ScrollView {
            VStack{
                Spacer()
                Divider()
                TextField("Title of recipe here", text: $title).padding(.all, 6)
                Divider()
                Image(systemName: "xmark.rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height:300, alignment: .center).foregroundColor(.gray)
                Divider()
                HStack {
                    Spacer()
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
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height:50, alignment: .center)
                    }
                    Button(action: {
                        sourceType = UIImagePickerController.SourceType.photoLibrary
                        showImagePicker.toggle()
                    }) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .leading)
                    }
                }.padding(6)
                TextEditor(text: $inputText).frame(width: 370, height: 900, alignment: .center).border(Color.gray, width: 2)
                
            }.accentColor(.gray)
            .sheet(isPresented: $showImagePicker, content: {
                ImagePicker(imageSeleceted: $imageSelected, sourceType: $sourceType)
            })
        }.navigationBarTitle("Add a recipe")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    print("Save button pressed...")
                                }) {
                                    Text("Save")
                                }
        )
        
    }
}

struct AddRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddRecipesView()
            
        }
        
    }
}
