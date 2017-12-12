//
//  OfferCollectionViewCell.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    var isFavorited = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageBackground: FavoritableImageView = {
        let view = FavoritableImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let valueLabel: UILabel = {
        let label = AttributedLabel()
        label.setAttributedText(string: "Current Value Label", fontType: .demiBold, size: 12, color: .textGray)
        
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = AttributedLabel()
        label.setAttributedText(string: "Name Label", fontType: .regular, size: 11, color: .textGray)
        
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func addSubviews() {
        addSubview(imageBackground)
        addSubview(valueLabel)
        addSubview(nameLabel)
    }
    
    func setupViews() {
        //Horizontal
        addConstraints(format: "H:|[v0]|", views: imageBackground)
        addConstraints(format: "H:|[v0]|", views: valueLabel)
        addConstraints(format: "H:|[v0]|", views: nameLabel)
        
        //Vertical
        addConstraints(format: "V:|[v0]-[v1]-[v2]|", views: imageBackground, valueLabel, nameLabel)
    }
    
    func setView(offer: Offer) {
        valueLabel.setAttributedText(string: offer.value)
        nameLabel.setAttributedText(string: offer.name)
        imageBackground.setView(favorited: offer.isFavorited)
    }
    
    func setView(image: UIImage?) {
        imageBackground.imageView.image = image
    }
    
}
