//
//  FavoriteButton.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/12/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class FavoriteButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("Favorite", for: .normal)
        backgroundColor = .mainAppColor
        tintColor = .white
        let image = UIImage(named: "StarFilled")?.withRenderingMode(.alwaysTemplate)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 8)
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
