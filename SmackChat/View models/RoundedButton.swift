//
//  RoundedButton.swift
//  SmackChat
//
//  Created by Ahmed on 12/7/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

   @IBInspectable var cornerRadious: CGFloat = 5 {
        
        didSet{
            
            self.layer.cornerRadius = cornerRadious
        }
        
    }
    
    override  func awakeFromNib() {
                
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    func setupView () {
        
        self.layer.cornerRadius = cornerRadious
    }
    
}
