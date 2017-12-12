//
//  OfferDetailView.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 8)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    func addSubviews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(termsLabel)
        stackView.addArrangedSubview(valueLabel)
        
        addSubview(imageView)
        addSubview(favoriteButton)
        addSubview(stackView)
    }
    
    func setupLayout() {
        imageView.addSubview(favoriteView)
        imageView.addConstraints(format: "H:[v0(30)]-6-|", views: favoriteView)
        imageView.addConstraints(format: "V:[v0(30)]-6-|", views: favoriteView)
        
        favoriteButton.setImage(favoriteImage, for: .normal)
        
        addConstraints(format: "H:|-32-[v0]-32-|", views: imageView)
        addConstraints(format: "H:|-32-[v0]-32-|", views: favoriteButton)
        addConstraints(format: "H:|-32-[v0]-32-|", views: stackView)
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75).isActive = true
        
        addConstraints(format: "V:|-16-[v0]-[v1]-[v2]", views: imageView, favoriteButton, stackView)
    }

}
