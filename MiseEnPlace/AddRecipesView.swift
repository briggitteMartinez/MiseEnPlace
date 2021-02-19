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
    
    
    var body: some View {
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
        .navigationBarItems(trailing:
                                Button(action: {
                                    postRecipe()
                                }) {
                                    Text("Save")
                                }
        )
        
    }
    
    func postRecipe(){
        print("post recipe to db")
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

