//
//  OfferDetailViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offer Detail"
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        
        setupViews()
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        imageView.image = UIImage(named: "ScrubDotsSample")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func setupViews() {
        view.backgroundColor = .blue
        
        view.addSubview(imageView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-32-[v0]-32-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75).isActive = true
        
        
    }

}
