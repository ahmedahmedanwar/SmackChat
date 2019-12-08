//
//  CreatAccountVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import DCAnimationKit
import TransitionButton

class CreatAccountVC: UIViewController {
    
   
    
    @IBOutlet weak var createAccountBtnoutlet: TransitionButton!
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//     //  self.view.createAccountBtnoutlet
//
//               createAccountBtnoutlet.backgroundColor = .blue
//                createAccountBtnoutlet.setTitle("button", for: .normal)
//                createAccountBtnoutlet.layer.cornerRadius = 20
//   //     createAccountBtnoutlet.spinnerColor = .red
//                createAccountBtnoutlet.addTarget(self, action: #selector(createAccountBtn(_:)), for: .touchUpInside)
//        createAccountBtnoutlet.addTarget(self, action: #selector(createAccountBtn(_:)), for: .touchUpInside)

    }
    
    @IBAction func createAccountBtn(_ button: TransitionButton) {
        
        guard let email = emailTxt.text , emailTxt.text != ""
            else {return}
        
        guard let password = passwordTxt.text, passwordTxt.text != ""
        
            else {return}
        
        AuthService.instance.registerUSer(email: email, password: password) { (success) in
            if success
            {
            
                AuthService.instance.loginUser(email: email, password: password) { (success) in
                    if success {
                        
              //          print("logein user!",AuthService.instance.userEmail)
                        
                        print("token",AuthService.instance.authToken)
                    }
                }
               
            }
            
        }
    }
    
    
    @IBAction func chooseAvatarBtn(_ sender: Any) {
    }
    
    
    @IBAction func backGroundBtnPick(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
 
}
