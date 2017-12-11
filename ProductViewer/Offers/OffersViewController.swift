//
//  ViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class OffersViewController: UICollectionViewController {

    let cellId = "cell"
    var offers = [Offer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Offers"
        
        collectionView?.backgroundColor = UIColor.white
        
        for _ in 0..<8 {
            offers.append(Offer(id: 110579,
                                url: "https://product-images.ibotta.com/offer/dUxYcQPeq391-DiywFZF8g-normal.png",
                                name: "Scotch-Brite® Scrub Dots Non-Scratch Scrub Sponges",
                                description: "Any variety - 2 ct. pack or larger",
                                terms: "Rebate valid on Scotch-Brite® Scrub Dots Non-Scratch Scrub Sponges for any variety, 2 ct. pack or larger.",
                                currentValue: "$0.75 Cash Back"))
        }
        collectionView?.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    //MARK: - Collection View Data Source Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? OfferCollectionViewCell else {
            fatalError("Failed to dequeue OfferCollectionViewCell.")
        }
        
        if let previousValueLabel = cell.currentValueLabel.attributedText {
            let newString = NSMutableAttributedString(attributedString: previousValueLabel)
            newString.mutableString.setString(offers[indexPath.row].currentValue)
            cell.currentValueLabel.attributedText = newString
        }
        if let previousNameLabel = cell.nameLabel.attributedText {
            let newString = NSMutableAttributedString(attributedString: previousNameLabel)
            newString.mutableString.setString(offers[indexPath.row].name)
            cell.nameLabel.attributedText = newString
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = OfferDetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}
