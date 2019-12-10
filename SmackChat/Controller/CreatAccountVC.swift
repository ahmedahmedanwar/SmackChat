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
    
    // Variables
      var avatarName = "profileDefault"
      var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    @IBOutlet weak var createAccountBtnoutlet: TransitionButton!
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    @IBAction func createAccountBtn(_ button: TransitionButton) {
        guard let name = userNameTxt.text , userNameTxt.text != "" else { return }
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
                    
                    AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                        if success {
                            print(UserDataService.instance.name, UserDataService.instance.avatarName)
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                        }else {
                            
                            debugPrint(Error.self)
                        }
                    }
                    
                )}
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
        
        //Calls this function when the tap is recognized.
        @objc func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
            view.endEditing(true)
        }
        
        
}
