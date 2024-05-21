//
//  User.swift
//  Threads
//
//  Created by Zeynep Baran on 18.05.2024.
//

import Foundation

struct User: Identifiable,Codable,Hashable{
    let id:String
    let fullname:String
    let email:String
    let username:String
    var profileImageUrl:String?
    var bio:String?
}
