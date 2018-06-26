//
//  Comment.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 26/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import Foundation

struct Comment {
    let uid: String
    let text: String
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.text = dictionary["text"] as? String ?? ""
    }
}
