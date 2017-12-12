//
//  OfferDetailViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OfferDetailViewController: UIViewController {

    var favoriteButton: UIButton?
    var offer: Offer

    init(offer: Offer) {
        self.offer = offer
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offer Detail"
        edgesForExtendedLayout = []
        favoriteButton?.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
    }
    
    override func loadView() {
        let detailView = OfferDetailView(frame: .zero)
        detailView.setView(offer: offer)
        view = detailView
        favoriteButton = detailView.favoriteButton
    }
    
    @objc func favoriteButtonTapped() {
        guard let view = view as? OfferDetailView else { return }
        offer.toggleFavorited()
        view.setView(favorited: offer.isFavorited)
    }
    
}
