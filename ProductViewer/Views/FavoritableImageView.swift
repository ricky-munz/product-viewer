//
//  FavoritableImageView.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class FavoritableImageView: UIView {

    private var isFavorited = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        backgroundColor = .imageBackgroundGray
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DefaultImage")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let favoriteView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "StarEmpty")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .mainAppColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(favoriteView)
    }
    
    func setupLayout() {
        addConstraints(format: "H:|-6-[v0]-6-|", views: imageView)
        addConstraints(format: "V:|-6-[v0]-6-|", views: imageView)
        
        addConstraints(format: "H:[v0(30)]-6-|", views: favoriteView)
        addConstraints(format: "V:[v0(30)]-6-|", views: favoriteView)
    }
    
    func setView(favorited: Bool) {
        if favorited {
            favoriteView.image = UIImage(named: "StarFilled")?.withRenderingMode(.alwaysTemplate)
            
        } else {
            favoriteView.image = UIImage(named: "StarEmpty")?.withRenderingMode(.alwaysTemplate)
        }
    }
    
}