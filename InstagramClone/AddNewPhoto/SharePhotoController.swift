//
//  SharePhotoController.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 08/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit
import Firebase

class SharePhotoController: UIViewController {
    
    var selectedImage: UIImage? {
        didSet {
            self.imageView.image = selectedImage
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView() 
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.rgb(red: 240, green: 240, blue: 240)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(handleShare))
        
        setupImageAndTextViews()
    }
    
    private func setupImageAndTextViews() {
        let containerView = UIView()
        containerView.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.anchor(x: nil, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        
        containerView.addSubview(imageView)
        imageView.anchor(x: nil, y: nil, top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 84, height: 0)
        
        containerView.addSubview(textView)
        textView.anchor(x: nil, y: nil, top: containerView.topAnchor, left: imageView.rightAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc private func handleShare() {
        guard let image = selectedImage else { return }
        guard let caption = textView.text, caption.count > 0 else { return }
        guard let uploadData = UIImageJPEGRepresentation(image, 0.5) else { return }
        
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        let filename = NSUUID().uuidString
        Storage.storage().reference().child("posts").child(filename).putData(uploadData, metadata: nil) { (metadata, error) in
            if let error = error {
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                print("Failed to upload post image:", error)
                return
            }
            Storage.storage().reference().child("posts").child(filename).downloadURL(completion: { (url, error) in
                guard let imageURL = url?.absoluteString else { return }
                self.saveToDatabase(imageUrl: imageURL, caption: caption)
            })
        }
    }
    
    private func saveToDatabase(imageUrl: String, caption: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let imageSize = selectedImage?.size else { return }
        
        let values = ["imageUrl": imageUrl, "caption": caption, "imageWidth": imageSize.width, "imageHeight": imageSize.height, "creationDate": Date().timeIntervalSince1970] as [String : Any]
        Database.database().reference().child("posts").child(uid).childByAutoId().updateChildValues(values) { (error, reference) in
            if let error = error {
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                print("Failed to save post to DB", error)
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
