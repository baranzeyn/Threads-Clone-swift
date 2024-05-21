//
//  ImageUploader.swift
//  Threads
//
//  Created by Zeynep Baran on 20.05.2024.
//

import Foundation
import Firebase
import FirebaseStorage
import SwiftUI 

struct ImageUploader{
    static func uploadImage(_ image:UIImage) async throws -> String?{
        //yüklenilen resmin boyutunu sınırlandır
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let filename=NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do{
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        }catch{
            print("debug: failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
    
}