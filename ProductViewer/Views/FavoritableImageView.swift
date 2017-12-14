//
//  FavoritableImageView.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

/// ImageView with a togglable 'favorite' indicator. The main image for this view utilizes the Kingfisher library to fetch images asynchronously and cache them in memory and on the disk.
class FavoritableImageView: UIView {

    private enum Metrics {
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
    
    /// Main image displayed by this ImageView.
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "DefaultImage").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    /// Favorite image indicator. Defaults to 'unfavorited' and can be toggled between 'favorited' and 'unfavorited' images.
    let favoriteView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "StarEmpty").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .primaryThemeColor
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
        activateConstraints(format: "H:|-m-[v0]-m-|", metrics: metrics, views: imageView)
        activateConstraints(format: "V:|-m-[v0]-m-|", metrics: metrics, views: imageView)
        
        activateConstraints(format: "H:[v0(l)]-m-|", metrics: metrics, views: favoriteView)
        activateConstraints(format: "V:[v0(l)]-m-|", metrics: metrics, views: favoriteView)
    }
    
    /// Set the favorite indicator for a 'favorited' state.
    func setFavoriteIndicator(favorited: Bool) {
        if favorited {
            favoriteView.image = favoriteImage
        } else {
            favoriteView.image = nonFavoriteImage
        }
    }
    
    /**
     Set url for the background image for this view. A default image is set while waiting for the fetch result. If a fetch result fails, the default image will remain. If nil is passed for parameter 'url' an 'unavailable' image will be set.
     
     The image is fetched asynchronously from a web service if the image has not already been cached. This method utilizes both memory and disk caching. This functionality is implemented using the Kingfisher library.
     - note: Since this method could start an asynchronous web call, the call should be canceled if the image is no longer needed using the following method:
     
            favoritableImageView.cancelImageFetch()
     
     - parameters:
        - url: URL string for image to be fetched.
     */
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
    
    /// Cancel the image download task bound to the image view if it is running. Nothing will happen if the downloading has already finished.
    func cancelImageFetch() {
        imageView.kf.cancelDownloadTask()
    }
    
}
