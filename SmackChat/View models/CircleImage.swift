//
//  CircleImage.swift
//  SmackChat
//
//  Created by Ahmed on 12/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit


@IBDesignable
class CircleImage: UIImageView {
    
    override func awakeFromNib() {
        
    setUpview()

    }
    
    func setUpview() {
        self.layer.cornerRadius = self.frame.width / 2
            
        self.clipsToBounds = true
    
    }
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
 //       setUpview(self : CircleImage )
        
    }
    
}
