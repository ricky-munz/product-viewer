//
//  ViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

///Offers Collection View Controller populates cells based on offer data. Tapping on a cell presents the detail view of that offer.
class OffersCollectionViewController: UICollectionViewController {
    private let cellId = "cell"
    private var offers = Offer.loadOffersFromJson()
    
    //MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Offers"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    //MARK: - Collection View Data Source Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? OfferCollectionViewCell else {
            fatalError("Failed to dequeue OfferCollectionViewCell.")
        }
        
        cell.set(offer: offers[indexPath.row])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? OfferCollectionViewCell else { return }
        cell.cancelImageFetch()
    }
    
    //MARK: - Collection View Delegate Methods
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = OfferDetailViewController(offer: offers[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
