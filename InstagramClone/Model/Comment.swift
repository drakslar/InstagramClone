//
//  Comment.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 26/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import Foundation

struct Comment {
    
    let user: User
    let uid: String
    let text: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.uid = dictionary["uid"] as? String ?? ""
        self.text = dictionary["text"] as? String ?? ""
    }
}
