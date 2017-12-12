//
//  AttributedLabel.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

enum FontType: String {
    case bold = "AvenirNext-Bold"
    case demiBold = "AvenirNext-DemiBold"
    case medium = "AvenirNext-Medium"
    case regular = "AvenirNext-Regular"
}

class AttributedLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAttributedText(string: String, fontType: FontType, size: Int, color: UIColor) {
        if let font = UIFont(name: fontType.rawValue, size: CGFloat(size)) {
            let attributes: [NSAttributedStringKey : Any] = [
                .foregroundColor: color,
                .font: font]
            attributedText = NSAttributedString(string: string, attributes: attributes)
        }
    }

}
