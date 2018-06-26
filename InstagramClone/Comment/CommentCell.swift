//
//  CommentCell.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 26/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit

class CommentCell: UICollectionViewCell {
    
    var comment: Comment? {
        didSet {
            guard let imageUrl = comment?.user.profileImageUrl else { return }
            guard let username = comment?.user.username else { return }
            guard let commentText = comment?.text else { return }
            let attributedText = NSMutableAttributedString(string: username, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSMutableAttributedString(string: " " + commentText, attributes: [.font: UIFont.systemFont(ofSize: 14)]))
            
            profileImageView.loadImage(urlString: imageUrl)
            commentTextView.attributedText = attributedText
        }
    }
    
    let commentTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.isScrollEnabled = false 
        return textView
    }()
    
    let profileImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true 
        imageView.layer.cornerRadius = 40 / 2
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(x: nil, y: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        
        addSubview(commentTextView)
        commentTextView.anchor(x: nil, y: nil, top: topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
        
        let lineSeparatorView = UIView()
        lineSeparatorView.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        addSubview(lineSeparatorView)
        lineSeparatorView.anchor(x: nil, y: nil, top: nil, left: commentTextView.leftAnchor, bottom: commentTextView.bottomAnchor, right: commentTextView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
