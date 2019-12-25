//
//  PhotosCollectionViewController.swift
//  SmackChat
//
//  Created by Ahmed on 12/16/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Photos


protocol photoVCDelegate {
    func receiveImg(img:UIImage)
}

class PhotosVC: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    @IBOutlet weak var phonePhotoImgView: UIImageView!
    
    //Variables
    
    var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
    
    @IBAction func backToCreateAccount(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  
}
extension PhotosVC: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let   cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "phoneImagesCell", for: indexPath) as! PhotosVC
        
      

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.images.count
    }
    func pupulatePhotos (){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized {
                
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                
                assets.enumerateObjects { (object, count, stop) in
                    self.images.append(object)
                }
                DispatchQueue.main.async {
                    self.photoCollectionView.reloadData()
                }
            }
        }
    }
    
}
