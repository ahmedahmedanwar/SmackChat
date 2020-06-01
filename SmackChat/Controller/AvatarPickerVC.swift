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
    
    var avtDarkImg : [String] = ["dark0","dark1","dark2","dark3","dark4","dark5","dark6","dark7","dark8","dark9","dark10","dark11","dark12","dark13","dark14","dark15","dark16","dark17","dark18","dark19","dark20","dark21","dark22","dark23","dark24","dark25","dark26","dark27"]
    
    var avtLightImage : [String] = ["light0","light1","light2","light3","light4","light5","light6","light7","light8","light9","light10","light11","light12","light13","light14","light15","light16","light17","light18","light19","light20","light21","light22","light23","light24","light25","light26","light27"]
    
    var flag = false
    
    
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
            
            flag = false
            //  avatarType = .dark
            
            
        }else {
            flag = true
            //    avatarType = .light
        }
        collectionView.reloadData()
    }
    
    
    @IBAction func dissmissView(_ sender: UIButton) {
        
           if let presenter = presentingViewController as? CreatAccountVC {
               presenter.email = "email"
            presenter.pass = "pass"
            presenter.userName = "userName"
            presenter.avatarName1 = "avatarName1"
            
        }
        dismiss(animated: true, completion: nil)
    }
    
}

extension AvatarPickerVC : UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            
            if flag == false{
                cell.avatarImage.image = UIImage(named: avtDarkImg[indexPath.item])

            }else {
                cell.avatarImage.image = UIImage(named: avtLightImage[indexPath.item] )
                                    
            }
            //      cell.configureCell(path: indexPath.item, type: avatarType)
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
        
        
        let createAccVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountVC") as! CreatAccountVC
        
        //if avatarType ==  .dark {
        if flag == false {
            
            //   UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.row)")
            createAccVC.avatarName1 = avtDarkImg[indexPath.row]
            
        }else {
            
            //   UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.row)")
            createAccVC.avatarName1 =  avtLightImage[indexPath.row]
            
        }
        
        present(createAccVC, animated: true)
       // performSegue(withIdentifier: "gotoCreateAccount", sender: nil)
    }
//    func showElements  (){
//        
//        if let presenter = presentingViewController as? CreatAccountVC {
//                     presenter.email = "email"
//                  presenter.pass = "pass"
//                  presenter.userName = "userName"
//                  presenter.avatarName1 = "avatarName1"
//        }
//    }
//    
}


