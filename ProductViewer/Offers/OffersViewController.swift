//
//  ViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

var offerImageCache = NSCache<NSString, UIImage>()

class OffersViewController: UICollectionViewController {

    let cellId = "cell"
    var offers = Offer.loadOffersFromJson()
    var operations = OperationQueue()
    
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
        
        let offer = offers[indexPath.row]
        cell.setView(offer: offer)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = OfferDetailViewController(offer: offers[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//    cell.imageView.kf.cancelDownloadTask()

//    }
    
}
