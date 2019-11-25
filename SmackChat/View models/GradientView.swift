//
//  GradientView.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

@IBDesignable

class GradientView: UIView {

    @IBInspectable var topColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) {
   
    didSet {
        self.setNeedsLayout()
    }
}
    @IBInspectable var bottomColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) {
       
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor,bottomColor.cgColor,topColor.cgColor]
        gradientLayer.startPoint = CGPoint( x: 1,y: 1 )
        gradientLayer.startPoint = CGPoint( x: 0 , y: 0 )
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

