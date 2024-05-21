//
//  Thread.swift
//  Threads
//
//  Created by Zeynep Baran on 20.05.2024.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread:Identifiable,Codable{
    @DocumentID var threadId:String?
    let ownerUid:String
    let caption:String
    let timestamp:Timestamp
    var likes:Int
    
    var id:String{
        return threadId ?? NSUUID().uuidString
    }
    
    var user:User?
}
