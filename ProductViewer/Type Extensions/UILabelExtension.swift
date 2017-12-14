//
//  UILabelExtension.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/12/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

/// Application font types.
enum FontType: String {
    case bold = "AvenirNext-Bold"
    case demiBold = "AvenirNext-DemiBold"
    case medium = "AvenirNext-Medium"
    case regular = "AvenirNext-Regular"
}

extension UILabel {
    
    /**
     Set attributed text for label. The attributes are applied to the entire string supplied.
     - parameters:
        - string: The attributed string to be set.
        - fontType: The font of the attributed string.
        - size: The size of the attributed string.
        - color: The color of the attributed string.
     */
    func setAttributedText(string: String, fontType: FontType, size: Int, color: UIColor) {
        if let font = UIFont(name: fontType.rawValue, size: CGFloat(size)) {
            let attributes: [NSAttributedStringKey : Any] = [
                .foregroundColor: color,
                .font: font]
            attributedText = NSAttributedString(string: string, attributes: attributes)
        }
    }
    
    /**
     Set attributed text for label. The attributes from the previous attributed text applied to the label will be used. The attributes are applied to the entire string supplied.
     - parameters:
        - string: The attributed string to be set.
     */
    func setAttributedText(string: String) {
        if let previousValueLabel = attributedText {
            let newString = NSMutableAttributedString(attributedString: previousValueLabel)
            newString.mutableString.setString(string)
            attributedText = newString
        }
    }
    
}
