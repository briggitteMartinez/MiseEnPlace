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
                    .frame(width: 350, height:300, alignment: .center)
                Divider()
                HStack {
                    Spacer()
                    Button(action: {print("take picture")}) {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height:50, alignment: .center)
                    }
                    Button(action: { print("uppload photo")}) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .leading)
                    }
                }.padding(6)
                TextEditor(text: $inputText).frame(width: 370, height: 900, alignment: .center).border(Color.gray, width: 2)
                
            }.accentColor(.gray)
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
