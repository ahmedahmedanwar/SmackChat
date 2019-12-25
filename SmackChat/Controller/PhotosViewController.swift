//
//  PhotosViewController.swift
//  SmackChat
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Photos


protocol PhotoVCDelegate: class {
    func receiveImg (img: UIImage)
    
}

class PhotosViewController: UIViewController {
  
    //variables
    
    var images = [PHAsset]()
    
    var clousureCallBack: ((_ img:UIImage ) ->  Void ) = {_ in}
    
    //Outlets ->
    
    @IBOutlet weak var collectionView: UICollectionView!
    weak open var delegate:PhotoVCDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        pupulateImgages()
            clousureCallBack  = {image in
           
       }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    @IBAction func backToAvatarVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
extension PhotosViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            
            return cell
        }else {
            
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        PHImageManager.default().requestImage(for: self.images[indexPath.row], targetSize: CGSize(width: 150, height: 150), contentMode: .aspectFit, options: nil)
        { image, _ in
            self.delegate?.receiveImg(img: image!)
        
                
        }
        
        
    }
    
    func pupulateImgages(){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized {
                
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { (object, count, stop) in
                    
                    self.images.append(object)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
    }
    
    
    
}
