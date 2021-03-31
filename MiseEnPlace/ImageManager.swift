//
//  ImageManager.swift
//  MiseEnPlace
//
//  Created by Briggitte Quintero Martinez on 2021-02-22.
//

import Foundation
import FirebaseStorage

let imageCache = NSCache<AnyObject, UIImage>()

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
    
    func downloadPostImage(postID: String, handler: @escaping(_ image: UIImage?)-> ()){
        //get path where img is saved!
        let path = getPostImagePath(postID: postID)
        
        //download img from path
        downloadImage(path: path) { (returnedImage) in
            handler(returnedImage)
            
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
    
    private func downloadImage(path: StorageReference, handler: @escaping (_ image: UIImage?) -> ()){
        if let cachedImage = imageCache.object(forKey: path){
            print("Image found in cache")
            handler(cachedImage)
            return
        }else {
            path.getData(maxSize: 27 * 1024 * 1024) { (returnedImageData, error) in
                if let data = returnedImageData, let image = UIImage(data: data) {
                    //succes getting img data
                    imageCache.setObject(image, forKey: path)
                    handler(image)
                    return
                }else {
                    print("error getting data from path for image")
                    handler(nil)
                    return
                }
            }
        }
        
        
        
    }
}
