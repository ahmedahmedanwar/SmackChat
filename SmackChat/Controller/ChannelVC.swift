//
//  ChannelVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
import FirebaseStorage


class ChannelVC: UIViewController{
    
    
    var imageAvatar2 = ""

    //outlets

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNamelbl: UILabel!
    
    
    @IBAction func prepareForUnWind(segue: UIStoryboardSegue){}



    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNamelbl.isHidden = true
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 90
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDataChanged(_:)), name: NOTIFY_USER_DATA_DID_CHANGED, object: nil)
        
  //      userImage.image = UIImage (named: imageAvatar2)
    
    }

    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @objc func userDataChanged (_ nofi: Notification){
        
        if  Auth.auth().currentUser != nil    {
            
            loginBtn.isHidden = true
            userNamelbl.isHidden = false
            guard let uid = Auth.auth().currentUser?.uid else{return}
    
            Database.database().reference().child("user").child(uid).observeSingleEvent(of: .value) { (snapshot) in
              
                guard let dict = snapshot.value as? [String: Any] else {return}
                
                let user = CurrentUser(uid: uid, dictionary: dict)
                
                self.userNamelbl.text = user.name
                
            }
        }
        
    }
    
}
