//
//  PreviewPhotoContainerView.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 21/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit
import Photos

class PreviewPhotoContainerView: UIView {
     
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cancel_shadow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "save_shadow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(previewImageView)
        previewImageView.anchor(x: nil, y: nil, top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(cancelButton)
        cancelButton.anchor(x: nil, y: nil, top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        addSubview(saveButton)
        saveButton.anchor(x: nil, y: nil, top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 24, paddingBottom: 24, paddingRight: 0, width: 50, height: 50)
    }
    
    @objc private func handleCancel() {
        self.removeFromSuperview()
    }
    
    @objc private func handleSave() {
        guard let previewImage = previewImageView.image else { return }
        let library = PHPhotoLibrary.shared()
        library.performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: previewImage)
        }) { (success, error) in
            if let error = error {
                print("Failed to save image to photo library", error)
                return
            }
            
            DispatchQueue.main.async {
                let saveLabel = UILabel()
                saveLabel.text = "Saved Successfully"
                saveLabel.font = UIFont.boldSystemFont(ofSize: 18)
                saveLabel.textAlignment = .center
                saveLabel.textColor = .white
                saveLabel.numberOfLines = 0
                saveLabel.backgroundColor = UIColor(white: 0, alpha: 0.4)
                saveLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 80)
                saveLabel.center = self.center
                saveLabel.layer.transform = CATransform3DMakeScale(0, 0, 0)
                saveLabel.layer.cornerRadius = 15
                saveLabel.clipsToBounds = true
                self.addSubview(saveLabel)
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    saveLabel.layer.transform = CATransform3DMakeScale(1, 1, 1)
                }, completion: { (completed) in
                    UIView.animate(withDuration: 0.5, delay: 0.75, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                        saveLabel.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
                        saveLabel.alpha = 0
                    }, completion: { (_) in
                        saveLabel.removeFromSuperview()
                    })
                })
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
