//
//  CommentsController.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 25/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit

class CommentsController: UICollectionViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
    }
    
}
