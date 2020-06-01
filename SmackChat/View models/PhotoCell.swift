//
//  PhotoCell.swift
//  SmackChat
//
//  Created by Ahmed on 12/19/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import Foundation
import Photos


class PhotoCell : UICollectionViewCell {
    
    @IBOutlet weak var photosImg: UIImageView!
    
    
      override func awakeFromNib() {
          super.awakeFromNib()
        setUpView()

        
    }
    func receiveImg(image:UIImage){
        
        photosImg.image = image
    }
    
    func setUpView (){
          
          self.layer.backgroundColor = UIColor.lightGray.cgColor
          self.layer.cornerRadius = 10
          self.clipsToBounds = true
      }
      
}
