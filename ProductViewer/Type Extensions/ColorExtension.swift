//
//  ColorExtension.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static var mainThemeColor: UIColor = {
       return UIColor(red:0.27, green:0.48, blue:0.62, alpha:1.0)
    }()
    
    static var imageBackgroundGray: UIColor = {
       return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    }()
    
    static var textGray: UIColor = {
       return UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.0)
    }()
}
