//
//  OfferDetailViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

/// Offer Detail View Controller allows the user to view details of an offer and 'favorite' an item.
class OfferDetailViewController: UIViewController {

    var favoriteButton: UIButton?
    var offer: Offer

    //MARK: - Init Methods
    init(offer: Offer) {
        self.offer = offer
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Offer Detail"
        edgesForExtendedLayout = []
        favoriteButton?.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        let detailView = OfferDetailView(frame: .zero)
        detailView.set(offer: offer)
        view = detailView
        favoriteButton = detailView.favoriteButton
    }
    
    //MARK: - Target Methods
    @objc func favoriteButtonTapped() {
        guard let view = view as? OfferDetailView else { return }
        offer.toggleFavorited()
        view.setFavoriteIndicator(favorited: offer.isFavorited)
    }
    
}
