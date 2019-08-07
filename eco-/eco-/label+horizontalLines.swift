//
//  label+horizontalLines.swift
//  eco-
//
//  Created by Joseph Duodu on 8/5/19.
//  Copyright © 2019 Sidhika Tripathee. All rights reserved.
//

import UIKit

extension UILabel {
    func drawLineOnBothSides(label: UILabel, labelWidth: CGFloat, color: UIColor) {
        
        //let fontAttributes = [NSAttributedString.Key.font: self.font]
        //let size = self.text?.size(withAttributes: fontAttributes as [NSAttributedString.Key : Any])
        let widthOfString = label.intrinsicContentSize.width
        print(widthOfString)
        
        let width = CGFloat(2)
        
        let leftLine = UIView(frame: CGRect(x: 0, y: self.frame.height/2 - width/2, width: labelWidth/2 - widthOfString/2 - 10, height: width))
        leftLine.backgroundColor = color
        self.addSubview(leftLine)
        
        let rightLine = UIView(frame: CGRect(x: labelWidth/2 + widthOfString/2 + 10, y: self.frame.height/2 - width/2, width: labelWidth/2 - widthOfString/2 - 10, height: width))
        rightLine.backgroundColor = color
        self.addSubview(rightLine)
    }
}
