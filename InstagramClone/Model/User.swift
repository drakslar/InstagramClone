//
//  User.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 10/05/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import Foundation

struct User {
    let uid: String
    let username: String
    let profileImageUrl: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? "" 
    }
}
