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
        
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.cornerRadius = cornerRadious
    }
    
}
