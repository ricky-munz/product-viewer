//
//  OfferCollectionViewFlowLayout.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/13/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

/// Offer Collection View Flow Layout creates a new flow layout with static app metrics and calculations to satisfy design requirements.
class OfferCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private enum Metrics {
        static let horizontalMargin: CGFloat = 12.0
        static let horizontalPadding: CGFloat = 8.0
        static let topMargin: CGFloat = 24.0
        static let verticalPadding: CGFloat = 24.0
        private static let availableWidth: CGFloat = {
            return screenWidth - 2*Metrics.horizontalMargin - Metrics.horizontalPadding
        }()
        private static let itemsPerRow: CGFloat = 2
        private static let itemSideLength = Metrics.availableWidth/Metrics.itemsPerRow
        static let itemSize = CGSize(width: Metrics.itemSideLength, height: Metrics.itemSideLength)
    }
    
    override init() {
        super.init()
        minimumLineSpacing = Metrics.verticalPadding
        minimumInteritemSpacing = Metrics.horizontalPadding
        
        sectionInset = UIEdgeInsets(top: Metrics.topMargin,
                                    left: Metrics.horizontalMargin,
                                    bottom: 0,
                                    right: Metrics.horizontalMargin)
        itemSize = Metrics.itemSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
