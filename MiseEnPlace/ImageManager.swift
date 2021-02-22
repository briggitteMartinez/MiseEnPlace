//
//  ImageManager.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-22.
//

import Foundation
import FirebaseStorage

class ImageManager {
    
    static let instance = ImageManager()
    private var ref_storage = Storage.storage()
    
    
    // GLOBAL FUNCTIONS
    func uploadPostImage(postID: String, image: UIImage, handler: @escaping(_ success: Bool) -> ()){
        
        //get image path
        let path = getPostImagePath(postID: postID)
        
        
        //Save image to path
        uploadImage(path: path, image: image) { (success) in
            handler(success)
        }
        
     
        
    }
    //PRIVATE FUNCTIONS
    
    private func getPostImagePath(postID: String) -> StorageReference {
        let postPath = "post/\(postID)/1"
        let storagePath = ref_storage.reference(withPath: postPath)
        return storagePath
        
    }
    
    
    private func uploadImage(path: StorageReference, image: UIImage, handler: @escaping (_ succes: Bool) -> ()){
       
        var compression: CGFloat = 1.0 // loops down by 0.05
        let maxFileSize: Int = 300 * 300 // max file size we want to save
        let maxCompression: CGFloat = 0.05 // max compression we alloud
        
        //get original image data
        guard var originalData = image.jpegData(compressionQuality: compression) else {
            print("error getting data")
            handler(false)
            return
        }
        
        // check maxfile size
        while (originalData.count > maxFileSize) && (compression > maxCompression) {
            compression -= 0.05
            if let compressedData = image.jpegData(compressionQuality: compression){
                originalData = compressedData
            }
            print(compression)
        }
        
        //get image data
        guard let finalData = image.jpegData(compressionQuality: compression) else {
            print("error getting data")
            handler(false)
            return
        }
        //get photo metadata
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        // Save data to path
        path.putData(finalData, metadata: metadata) { (_, error) in
            if let error = error {
                //error
                print("error uploading image. \(error)")
                handler(false)
                return
            }else{
                //success
                print("succes uploading image")
                handler(true)
                return
            }
            
        }
    }
}
