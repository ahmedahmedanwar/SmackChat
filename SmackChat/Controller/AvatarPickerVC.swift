//
//  AvatarPickerVC.swift
//  SmackChat
//
//  Created by Ahmed on 12/12/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController  {
    
    
    //Variables
    

    var avatarType = Avatartype.dark
    
    // Outlets
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }
    
 
    @IBAction func segmentControlChanged(_ sender: Any) {

          if segmentControl.selectedSegmentIndex == 0 {

            avatarType = .dark


          }else {

            avatarType = .light
        }
        collectionView.reloadData()
    }
    
    
    @IBAction func dissmissView(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

extension AvatarPickerVC : UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(path: indexPath.item, type: avatarType)
            return cell
        }
        
        
        return AvatarCell ()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numofCulomns : CGFloat = 3
        
        if UIScreen.main.bounds.width > 320 {
            
            numofCulomns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) -
        (numofCulomns - 1) * spaceBetweenCells ) /  numofCulomns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else {
            
             UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
