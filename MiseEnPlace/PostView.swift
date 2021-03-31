//
//  PostView.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-08.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var postImage: UIImage = UIImage(named: "rotfrukter")!
    
    var body: some View {
        VStack(alignment: .leading){
            Text(post.title).font(.title2)
            Image(uiImage: postImage).resizable().scaledToFit()
        }
        .onAppear{
            getImage()
            
        }
    }
    func getImage(){
        //get postimage
        ImageManager.instance.downloadPostImage(postID: post.postID) { (returnedImage) in
            if let image = returnedImage {
                self.postImage = image
            }
        }
    }
    
}




struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", title: "This is my delicious Recipe", dateCreated: Date())
    static var previews: some View {
        PostView(post: post)
    }
}
