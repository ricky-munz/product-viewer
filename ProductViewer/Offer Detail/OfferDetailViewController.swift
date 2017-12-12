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
    
    let favoriteView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "StarFilled")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .mainAppColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let favoriteImage: UIImage? = {
        let image = UIImage(named: "StarFilled")?.withRenderingMode(.alwaysTemplate)
        return image
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.backgroundColor = .mainAppColor
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: -8, bottom: 8, right: 8)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupViews() {       
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel, termsLabel, valueLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(favoriteButton)
        view.addSubview(stackView)
        
        imageView.addSubview(favoriteView)
        imageView.addConstraints(format: "H:[v0(30)]-6-|", views: favoriteView)
        imageView.addConstraints(format: "V:[v0(30)]-6-|", views: favoriteView)
        
        favoriteButton.setImage(favoriteImage, for: .normal)
        
        view.addConstraints(format: "H:|-32-[v0]-32-|", views: imageView)
        view.addConstraints(format: "H:|-32-[v0]-32-|", views: favoriteButton)
        view.addConstraints(format: "H:|-32-[v0]-32-|", views: stackView)
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75).isActive = true
        
        view.addConstraints(format: "V:|-16-[v0]-[v1]-[v2]", views: imageView, favoriteButton, stackView)
    }

}
