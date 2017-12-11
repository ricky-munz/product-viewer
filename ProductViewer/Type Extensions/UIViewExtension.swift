//
//  UIViewExtension.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addConstraints(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        
        for (i, view) in views.enumerated() {
            let key = "v\(i)"
            viewsDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
    
}
