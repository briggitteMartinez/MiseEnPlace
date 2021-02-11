//
//  RecipesView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-05.
//

import SwiftUI

struct RecipesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            PostView()
            PostView()
            PostView()
        }).navigationBarTitle("Recipes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    print("Add button pressed...")
                                }) {
                                    Image(systemName: "plus")
                                }
        )
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesView()
        }
        
    }
}
