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
        edgesForExtendedLayout = []
    }
    
    override func loadView() {
        view = OfferDetailView(frame: CGRect.zero)
    }

}
