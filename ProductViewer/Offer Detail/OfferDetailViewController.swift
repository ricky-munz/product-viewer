//
//  OfferDetailViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offer Detail"
        view.backgroundColor = .white
        
        edgesForExtendedLayout = []
        
        setupViews()
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        imageView.image = UIImage(named: "ScrubDotsSample")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.backgroundColor = .mainAppColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    
    func setupViews() {       
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel, termsLabel, valueLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(favoriteButton)
        view.addSubview(stackView)
        
        view.addConstraints(format: "H:|-32-[v0]-32-|", views: imageView)
        view.addConstraints(format: "H:|-32-[v0]-32-|", views: favoriteButton)
        view.addConstraints(format: "H:|-32-[v0]-32-|", views: stackView)
        
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.75).isActive = true
        
        view.addConstraints(format: "V:|-16-[v0]-[v1]-[v2]", views: imageView, favoriteButton, stackView)
    }

}
