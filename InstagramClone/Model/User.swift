//
//  User.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 10/05/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import Foundation

struct User {
    let username: String
    let profileImageUrl: String
    
    init(dictionary: [String: Any]) {
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? "" 
    }
}
