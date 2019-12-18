//
//  AvatarCell.swift
//  SmackChat
//
//  Created by Ahmed on 12/12/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

enum Avatartype {
    case dark
    case light
    
}

class AvatarCell: UICollectionViewCell {
    
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }
    
    
    
    func configureCell(path: Int , type: Avatartype){
        
        if type == Avatartype.dark {
            
            avatarImage.image =  UIImage(named: "light\(String(describing: index))")
            
        }else {
            
            
            avatarImage.image =  UIImage(named: "light\(String(describing: index))")
            
        }
    }
    
    func setUpView (){
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
