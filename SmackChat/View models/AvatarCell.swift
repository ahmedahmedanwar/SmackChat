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
    
    var avtDarkImg = ["dark0","dark1","dark2","dark3","dark4","dark5","dark6","dark7","dark8","dark9","dark10",
                       "dark11","dark12","dark13","dark14","dark15","dark16","dark17","dark18","dark19","dark20","dark21","dark22","dark23","dark24","dark25","dark26","dark27"]
    
     var avtLightImage = ["light0","light1","light2","light3","light4","light5","light6","light7","light8","light9","light10","light11","light12","light13","light14","light15","light16","light17","light18","light19","light20","light21","light22","light23","light24","light25","light26","light27"]
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpView()
    }
    
    
    
    func configureCell(path: Int , type: Avatartype){
        
        if type == Avatartype.dark {
            
        avatarImage.image =  UIImage(named: "light\(String(describing: index))")
     //       avatarImage.image = UIImage(cgImage: avtDarkImg as! CGImage)
        }else {
            
            
          avatarImage.image =  UIImage(named: "light\(String(describing: index))")
     //           avatarImage.image = UIImage(cgImage: avtLightImage as! CGImage)
            
        }
    }
    
    func setUpView (){
        
        self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) //UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
