//
//  UILabelExtension.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/12/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setAttributedText(string: String) {
        if let previousValueLabel = attributedText {
            let newString = NSMutableAttributedString(attributedString: previousValueLabel)
            newString.mutableString.setString(string)
            attributedText = newString
        }
    }
    
}
