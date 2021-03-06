//
//  PostArrayObject.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-16.
//

import Foundation

class PostArrayObject: ObservableObject{
    
    @Published var dataArray = [PostModel]()
    
    init() {
        let post1 = PostModel(postID: "", title: "This is a Title", dateCreated: Date())
        let post2 = PostModel(postID: "", title: "This is another Title", dateCreated: Date())
        let post3 = PostModel(postID: "", title: "This is a great Title", dateCreated: Date())
        let post4 = PostModel(postID: "", title: "This is a tiny itsy bitty Title", dateCreated: Date())
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    //single post
    init(post:PostModel){
        self.dataArray.append(post)
    }
    
    //for feed
    init(shuffled: Bool) {
        print("get posts for feed. shuffled \(shuffled)")
        Data.instance.downloadPostsForFeed { (returnedPosts) in
            if shuffled {
                let shuffledPosts = returnedPosts.shuffled()
                self.dataArray.append(contentsOf: shuffledPosts)
            }else {
                self.dataArray.append(contentsOf: returnedPosts)
            }
        }
        
    }
}
