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
    
    let currentValueLabel: UILabel = {
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
        addSubview(currentValueLabel)
        addSubview(nameLabel)
    }
    
    func setupViews() {
        //Horizontal
        addConstraints(format: "H:|[v0]|", views: imageBackground)
        addConstraints(format: "H:|[v0]|", views: currentValueLabel)
        addConstraints(format: "H:|[v0]|", views: nameLabel)
        
        //Vertical
        addConstraints(format: "V:|[v0]-[v1]-[v2]|", views: imageBackground, currentValueLabel, nameLabel)
    }
    
    func setView(offer: Offer) {
        set(text: offer.currentValue, label: currentValueLabel)
        set(text: offer.name, label: nameLabel)
        
        imageBackground.setView(favorited: offer.isFavorited)
    }
    
    //TODO: move this to UILabel extension
    private func set(text: String, label: UILabel) {
        if let previousValueLabel = label.attributedText {
            let newString = NSMutableAttributedString(attributedString: previousValueLabel)
            newString.mutableString.setString(text)
            label.attributedText = newString
        }
    }
    
}
