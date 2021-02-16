//
//  RecipesView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-05.
//

import SwiftUI

struct RecipesView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack{
                ForEach(posts.dataArray, id:\.self){ post in
                    PostView(post: post)
                }
            }
            
        }).navigationBarTitle("Recipes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: AddRecipesView(),
                                    label: {
                                        Image(systemName: "plus")
                                    })
        )
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesView(posts: PostArrayObject())
        }
        
    }
}
