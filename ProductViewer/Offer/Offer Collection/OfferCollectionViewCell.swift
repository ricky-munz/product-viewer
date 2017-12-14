//
//  OfferCollectionViewCell.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

/// Offer Collection View Cell shows an image of the offer and the 'favorite' state. It can be populated with an offer object.
class OfferCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.setAttributedText(string: "Current Value Label", fontType: .demiBold, size: 12, color: .primaryTextColor)
        
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.setAttributedText(string: "Name Label", fontType: .regular, size: 11, color: .primaryTextColor)
        
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func addSubviews() {
        addSubview(favoritableImageView)
        addSubview(valueLabel)
        addSubview(nameLabel)
    }
    
    private func setupLayout() {
        //Horizontal
        activateConstraints(format: "H:|[v0]|", views: favoritableImageView)
        activateConstraints(format: "H:|[v0]|", views: valueLabel)
        activateConstraints(format: "H:|[v0]|", views: nameLabel)
        
        //Vertical
        activateConstraints(format: "V:|[v0]-[v1]-[v2]|", views: favoritableImageView, valueLabel, nameLabel)
    }
    
    /**
     Set view with offer details.
     - parameters:
        - offer: Offer object to populate view details.
     */
    func set(offer: Offer) {
        valueLabel.setAttributedText(string: offer.value)
        nameLabel.setAttributedText(string: offer.name)
        favoritableImageView.setFavoriteIndicator(favorited: offer.isFavorited)
        favoritableImageView.setBackgroundImage(url: offer.url)
    }
    
    ///Cancel the image download task bound to the image view if it is running. Nothing will happen if the downloading has already finished. Should be called if cell has disappeared from view.
    func cancelImageFetch() {
        favoritableImageView.cancelImageFetch()
    }
    
}
