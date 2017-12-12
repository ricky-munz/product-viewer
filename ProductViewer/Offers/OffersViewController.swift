//
//  ViewController.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation
import UIKit

class OffersViewController: UICollectionViewController {

    let cellId = "cell"
    var offers = Offer.loadOffersFromJson()
    var offerImages = NSCache<NSString, UIImage>()
    
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
        cell.setView(image: UIImage(named: "DefaultImage")?.withRenderingMode(.alwaysTemplate))
        
        if let urlString = offer.url, let url = URL(string: urlString) {
            if let image = offerImages.object(forKey: urlString as NSString) {
                cell.setView(image: image)
                
            } else {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                    
                    if let data = data, let image = UIImage(data: data) {
                        self.offerImages.setObject(image, forKey: url.absoluteString as NSString)
                        
                        DispatchQueue.main.async {
                            if collectionView.indexPathsForVisibleItems.contains(indexPath) {
                                cell.setView(image: image)
                            }
                        }
                    }
                }).resume()
            }
        } else {
            cell.setView(image: #imageLiteral(resourceName: "Unavailable"))
        }
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = OfferDetailViewController(offer: offers[indexPath.row])
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}
