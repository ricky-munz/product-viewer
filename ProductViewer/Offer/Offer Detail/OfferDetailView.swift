//
//  OfferDetailView.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

/// Offer Detail View includes an image of the offer with a 'favorite' indicator and a button for toggling the 'favorite' state.
class OfferDetailView: UIView {

    private enum Metrics {
        static let horizontalMargin: CGFloat = 32.0
        static let topMargin: CGFloat = 16.0
        static let screenWidthRatio: CGFloat = 0.6 * screenWidth
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let favoritableImageView: FavoritableImageView = {
        let view = FavoritableImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let favoriteButton: UIButton = {
        let button = FavoriteButton()
        return button
    }()
    
    let labelStackView: UIStackView = {
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
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        labelStackView.addArrangedSubview(termsLabel)
        labelStackView.addArrangedSubview(valueLabel)
        
        addSubview(favoritableImageView)
        addSubview(favoriteButton)
        addSubview(labelStackView)
    }
    
    func setupLayout() {
        let horizontalMetrics = ["hm": Metrics.horizontalMargin]
        activateConstraints(format: "H:|-hm-[v0]-hm-|", metrics: horizontalMetrics, views: favoritableImageView)
        activateConstraints(format: "H:|-hm-[v0]-hm-|", metrics: horizontalMetrics, views: favoriteButton)
        activateConstraints(format: "H:|-hm-[v0]-hm-|", metrics: horizontalMetrics, views: labelStackView)
        
        let verticalMetrics = ["tm": Metrics.topMargin, "swr": Metrics.screenWidthRatio]
        activateConstraints(format: "V:|-tm-[v0(>=swr)]-[v1]-[v2]",
                       metrics: verticalMetrics,
                       views: favoritableImageView, favoriteButton, labelStackView)
    }

    /**
     Set view with offer details.
     - parameters:
        - offer: Offer object to populate view details.
     */
    func set(offer: Offer) {
        favoritableImageView.setBackgroundImage(url: offer.url)
        
        nameLabel.text = offer.name
        descriptionLabel.text = offer.description
        termsLabel.text = offer.terms
        valueLabel.text = offer.value
        
        setFavoriteIndicator(favorited: offer.isFavorited)
    }
    
    /// Set favorite indicator with 'favorite' state.
    func setFavoriteIndicator(favorited: Bool) {
        favoritableImageView.setFavoriteIndicator(favorited: favorited)
    }

}
