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

    @IBInspectable var topColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1) {
   
    didSet {
        self.setNeedsLayout()
    }
}
    @IBInspectable var bottomColor = #colorLiteral(red: 0.5721009374, green: 0.7555337548, blue: 1, alpha: 1) {
       
        didSet {
            self.setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor.cgColor,bottomColor.cgColor,topColor.cgColor,bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint( x: 1,y: 1 )
        gradientLayer.startPoint = CGPoint( x: 0 , y: 0 )
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

