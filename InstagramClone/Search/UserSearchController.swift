//
//  UserSearchController.swift
//  InstagramClone
//
//  Created by Zan Drakslar on 15/06/2018.
//  Copyright © 2018 Zan Drakslar. All rights reserved.
//

import UIKit

class UserSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cellId = "cellId"
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Enter username"
        searchBar.tintColor = .gray
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(UserSearchCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserSearchCell 
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 66)
    }
    
    private func setupNavBar() {
        let navBar = navigationController?.navigationBar
        navBar?.addSubview(searchBar)
        searchBar.anchor(x: nil, y: nil, top: navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
}
