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
        imageView.backgroundColor = .cyan
        imageView.image = UIImage(named: "ScrubDotsSample")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let currentValueLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.text = "Current Value Label"
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "name label"
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        backgroundColor = UIColor.blue
        
        addSubview(imageBackground)
        addSubview(currentValueLabel)
        addSubview(nameLabel)
        
        imageBackground.addSubview(imageView)
        
        //Horizontal
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageBackground]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": currentValueLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
        //TODO: Move this into subclass
        imageBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-6-[v0]-6-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        //Vertical
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-[v1]-[v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageBackground, "v1": currentValueLabel, "v2": nameLabel]))
        
        //TODO: Move this into subclass
        imageBackground.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[v0]-6-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
    }
    
}
