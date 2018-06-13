//
//  Post.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 11/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import Foundation

struct Post {
    let imageUrl: String
    
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
