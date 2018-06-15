//
//  UserSearchCell.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 15/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit

class UserSearchCell: UICollectionViewCell {
    
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50 / 2
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(x: nil, y: centerYAnchor, top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(usernameLabel)
        usernameLabel.anchor(x: nil, y: nil, top: topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        addSubview(separatorView)
        separatorView.anchor(x: nil, y: nil, top: nil, left: usernameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
