//
//  Data.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-19.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import AuthenticationServices

let db = Firestore.firestore()

class Data { // upload and download data to firebase
    
    static let instance = Data()
    
    private var R_POSTS = db.collection("recipes")
    
    
    
    
    
    func uploadPost(image: UIImage, title: String?, recipeText: String?,useriD: String, handler: @escaping(_ success: Bool)->()){
     
        //create new post document
        let document = R_POSTS.document()
        let postID = document.documentID
        
        //upload Image to storage
        ImageManager.instance.uploadPostImage(postID: postID, image: image) { (success) in
            if success {
                // successfully oploaded image data to storage
                //upload to db
                let postData: [String:Any] = [
                    DatabasePostField.postID : postID,
                    DatabasePostField.userID : useriD,
                    DatabasePostField.title : title,
                    DatabasePostField.recipeText : recipeText,
                    DatabasePostField.dateCreated : FieldValue.serverTimestamp()
                ]
                
                document.setData(postData) { (error) in
                    if let error = error {
                        print ("error uploading data to post document. \(error)")
                        handler(false)
                        return
                    }else{
                        //return back to app
                        handler(true)
                        return
                    }
                    
                }
                
            }else{
               print("error uploading imgage to firebase")
                handler(false)
                return
            }
        }
        
    }
}

struct DatabasePostField { // fields within post doc in db
    
    static let postID = "post_id"
    static let userID = "user_id"
    static let title = "title"
    static let recipeText = "recipe_text"
    static let dateCreated = "date_created"
}
