//
//  OfferCollectionViewCell.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageBackground: UIView = {
        let view = BorderedImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let currentValueLabel: UILabel = {
        let label = UILabel()
        
        if let font = UIFont(name: "AvenirNext-DemiBold", size: 12) {
            let attributes: [NSAttributedStringKey : Any] = [
                .foregroundColor: UIColor.textGray,
                .font: font]
            label.attributedText = NSAttributedString(string: "Current Value Label", attributes: attributes)
        }
        
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        
        if let font = UIFont(name: "AvenirNext-Regular", size: 11) {
            let attributes: [NSAttributedStringKey : Any] = [
                .foregroundColor: UIColor.textGray,
                .font: font]
            label.attributedText = NSAttributedString(string: "Name Label", attributes: attributes)
        }
        
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
    
}
