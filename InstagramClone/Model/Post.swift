//
//  Post.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 11/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import Foundation

struct Post {
    let user: User
    let imageUrl: String
    let caption: String
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
    }
}
