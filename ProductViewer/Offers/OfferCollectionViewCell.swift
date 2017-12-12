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
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
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
    
    let imageBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let currentValueLabel: UILabel = {
        let label = UILabel()
        
        if let font = UIFont(name: "AvenirNext-DemiBold", size: 12) {
            let attributes: [NSAttributedStringKey : Any] = [
                .foregroundColor: UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.0),
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
                .foregroundColor: UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0),
                .font: font]
            label.attributedText = NSAttributedString(string: "Name Label", attributes: attributes)
        }
        
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        addSubview(imageBackground)
        addSubview(currentValueLabel)
        addSubview(nameLabel)
        
        imageBackground.addSubview(imageView)
        imageBackground.addSubview(favoriteView)
        
        //Horizontal
        addConstraints(format: "H:|[v0]|", views: imageBackground)
        addConstraints(format: "H:|[v0]|", views: currentValueLabel)
        addConstraints(format: "H:|[v0]|", views: nameLabel)
        
        //TODO: Move this into subclass
        imageBackground.addConstraints(format: "H:|-6-[v0]-6-|", views: imageView)
        imageBackground.addConstraints(format: "H:[v0(30)]-6-|", views: favoriteView)
        
        //Vertical
        addConstraints(format: "V:|[v0]-[v1]-[v2]|", views: imageBackground, currentValueLabel, nameLabel)
        
        //TODO: Move this into subclass
        imageBackground.addConstraints(format: "V:|-6-[v0]-6-|", views: imageView)
        imageBackground.addConstraints(format: "V:[v0(30)]-6-|", views: favoriteView)
    }
    
}
