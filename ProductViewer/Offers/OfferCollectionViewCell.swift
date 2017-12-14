//
//  OfferCollectionViewCell.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    private var isFavorited = false
    
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
        label.setAttributedText(string: "Current Value Label", fontType: .demiBold, size: 12, color: .textGray)
        
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.setAttributedText(string: "Name Label", fontType: .regular, size: 11, color: .textGray)
        
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
        addConstraints(format: "H:|[v0]|", views: favoritableImageView)
        addConstraints(format: "H:|[v0]|", views: valueLabel)
        addConstraints(format: "H:|[v0]|", views: nameLabel)
        
        //Vertical
        addConstraints(format: "V:|[v0]-[v1]-[v2]|", views: favoritableImageView, valueLabel, nameLabel)
    }
    
    func setView(offer: Offer) {
        valueLabel.setAttributedText(string: offer.value)
        nameLabel.setAttributedText(string: offer.name)
        favoritableImageView.setFavoriteIndicator(favorited: offer.isFavorited)
        favoritableImageView.setBackgroundImage(url: offer.url)
    }
    
    func cancelImageFetch() {
        favoritableImageView.cancelImageFetch()
    }
    
}
