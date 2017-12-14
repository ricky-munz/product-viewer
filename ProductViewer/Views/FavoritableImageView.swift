//
//  FavoritableImageView.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

class FavoritableImageView: UIView {

    enum Metrics {
        static let margin: CGFloat = 6
        static let favoriteImageSideLength: CGFloat = 30
        static let cornerRadius: CGFloat = 5.0
        static let imageFadeInDuration = 0.2
    }
    
    private var isFavorited = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = Metrics.cornerRadius
        backgroundColor = .imageBackgroundGray
        
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let favoriteImage = #imageLiteral(resourceName: "StarFilled").withRenderingMode(.alwaysTemplate)
    let nonFavoriteImage = #imageLiteral(resourceName: "StarEmpty").withRenderingMode(.alwaysTemplate)
    let defaultImage = #imageLiteral(resourceName: "DefaultImage").withRenderingMode(.alwaysTemplate)
    let unavailableImage = #imageLiteral(resourceName: "Unavailable").withRenderingMode(.alwaysTemplate)
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "DefaultImage").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let favoriteView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "StarEmpty").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .mainThemeColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(favoriteView)
    }
    
    private func setupLayout() {
        let metrics = [
            "m": Metrics.margin,
            "l": Metrics.favoriteImageSideLength
        ]
        addConstraints(format: "H:|-m-[v0]-m-|", metrics: metrics, views: imageView)
        addConstraints(format: "V:|-m-[v0]-m-|", metrics: metrics, views: imageView)
        
        addConstraints(format: "H:[v0(l)]-m-|", metrics: metrics, views: favoriteView)
        addConstraints(format: "V:[v0(l)]-m-|", metrics: metrics, views: favoriteView)
    }
    
    func setFavoriteIndicator(favorited: Bool) {
        if favorited {
            favoriteView.image = favoriteImage
        } else {
            favoriteView.image = nonFavoriteImage
        }
    }
    
    func setBackgroundImage(url urlString: String?) {
        if let urlString = urlString {
            let url = URL(string: urlString)
            imageView.kf.setImage(with: url,
                                  placeholder: defaultImage,
                                  options: [.transition(.fade(Metrics.imageFadeInDuration))])
            
        } else {
            imageView.image = unavailableImage
        }
    }
    
    func cancelImageFetch() {
        imageView.kf.cancelDownloadTask()
    }
    
}
