//
//  PostView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-08.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(post.title).font(.title2)
            Image("rotfrukter").resizable().scaledToFit()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", title: "This is my delicious Recipe", dateCreated: Date())
    static var previews: some View {
        PostView(post: post)
    }
}
