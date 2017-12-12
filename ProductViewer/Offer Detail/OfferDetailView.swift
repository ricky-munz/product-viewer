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
    
    let imageView: FavoritableImageView = {
        let view = FavoritableImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let favoriteButton: UIButton = {
        let button = FavoriteButton()
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
        addConstraints(format: "H:|-32-[v0]-32-|", views: imageView)
        addConstraints(format: "H:|-32-[v0]-32-|", views: favoriteButton)
        addConstraints(format: "H:|-32-[v0]-32-|", views: stackView)
        
        addConstraints(format: "V:|-16-[v0]-[v1]-[v2]", views: imageView, favoriteButton, stackView)
    }
    
    func setView(favorited: Bool) {
        imageView.setView(favorited: favorited)
    }
    
    func setView(offer: Offer) {
        nameLabel.text = offer.name
        descriptionLabel.text = offer.description
        termsLabel.text = offer.terms
        valueLabel.text = offer.currentValue
        
        setView(favorited: offer.isFavorited)
    }

}
