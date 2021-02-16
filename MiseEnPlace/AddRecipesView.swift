//
//  AddRecipesView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-16.
//

import SwiftUI

struct AddRecipesView: View {
    @State var title = ""
    @State var inputText = ""
    var body: some View {
        ScrollView {
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Divider()
                TextField("Title of recipe here", text: $title).padding(.all, 6)
                Divider()
                Image(systemName: "photo").resizable().scaledToFit().accentColor(.gray)
                Divider()
                TextEditor(text: $inputText)
                Spacer()
                
            }
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
