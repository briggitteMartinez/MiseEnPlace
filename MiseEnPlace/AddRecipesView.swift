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
    @Binding var imageSelected: UIImage
    @Environment(\.presentationMode) var presentationMode
    
    //alert
    @State var showAlert : Bool = false
    @State var postUploadedSuccessfully : Bool = false
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Spacer()
                    Divider()
                    TextField("Title of recipe here", text: $title).padding(.all, 6)
                    Divider()
                    Image(uiImage: imageSelected)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height:300, alignment: .center)
                        .foregroundColor(.gray)
                        .clipped()
                    Divider()
                    TextEditor(text: $inputText)
                        .frame(width: 360, height: 900, alignment: .center)
                        .border(Color.gray, width: 4)
                        .cornerRadius(20).padding(.top, 10)
                    
                }.accentColor(.gray)
                
            }.navigationBarTitle("Add a recipe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
            },
            
            trailing:
                Button(action: {
                    postRecipe()
                }) {
                    Text("Save")
                }
            )
            .alert(isPresented: $showAlert) { () -> Alert in
                getAlert()
            }
            
        }
    }
    
    func getAlert() -> Alert {
        
        if postUploadedSuccessfully {
            return Alert(title: Text("Successfully upploaded post!"), message: nil, dismissButton: .default(Text("OK"), action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        }else{
            return Alert(title: Text("error uploading post"))
        }
    }
    
    func postRecipe(){
        print("post recipe to db")
        Data.instance.uploadPost(image: imageSelected, title: title, recipeText: inputText, useriD: "Briggan") { (success) in
            self.postUploadedSuccessfully = success
            self.showAlert.toggle()
        }
    }
}

struct AddRecipesView_Previews: PreviewProvider {
    
    @State static var image = UIImage(systemName: "xmark.rectangle")!
    
    static var previews: some View {
        NavigationView{
            AddRecipesView(imageSelected: $image)
            
        }
        
    }
}

