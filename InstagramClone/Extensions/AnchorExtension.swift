//
//  AnchorExtension.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 27/04/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor?, top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let x = x {
            self.centerXAnchor.constraint(equalTo: x).isActive = true
        }
        
        if let y = y {
            self.centerYAnchor.constraint(equalTo: y).isActive = true
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        } 
    }
    
}


