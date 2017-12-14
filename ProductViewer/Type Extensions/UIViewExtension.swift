//
//  UIViewExtension.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import UIKit

// Extension to simplify visual format language constructor for constraints.
extension UIView {
    
    /**
     Activate an array of constraints using an ASCII art-like visual format string.
     - parameters:
        - format: The format specification for the constraints. The format MUST name views as 'v0', 'v1', ... 'vn' or the application will crash.
        - metrics: A dictionary of constants that appear in the visual format string. The dictionary’s keys must be the string values used in the visual format string.
        - views: A list of views that appear in the visual format string. The number of items in this list must match the number of views specified in the format parameter.
     
     - Example:
     
            let verticalMetrics = ["tm": topMargin, "h": height]
            addConstraints(format: "V:|-tm-[v0(h)]-[v1]-[v2]",
                           metrics: verticalMetrics,
                           views: view0, view1, view2)
     */
    func activateConstraints(format: String, metrics: [String: Any]? = nil, views: UIView...) {
        var viewsDict = [String: UIView]()
        
        for (i, view) in views.enumerated() {
            let key = "v\(i)"
            viewsDict[key] = view
        }
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: metrics, views: viewsDict))
    }
    
}
