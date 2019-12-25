//
//  Photo'sCollectionViewController.swift
//  SmackChat
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UIViewController {
   
    
    @IBOutlet weak var phonePhotos: UIImageView!
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
 
    }


    // MARK: UICollectionViewDataSource


    @IBAction func backToCreateAccount(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension PhotosCollectionViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           5
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        if  let  cell = photosCollectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as? PhotosCollectionViewController{
            
              return cell
    }
       
    
    
}

}
