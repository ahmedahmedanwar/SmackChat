//
//  LoginVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
      // Variables
      var avatarName = "profileDefault"
      var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
               let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

                   //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
                   tap.cancelsTouchesInView = false

                   view.addGestureRecognizer(tap)
               
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func creatAccountBtnPressed(_ sender: UIButton) {
     
          
        performSegue(withIdentifier: To_CreateAccount, sender: nil)
    }
    //Calls this function when the tap is recognized.
         @objc func dismissKeyboard() {
             //Causes the view (or one of its embedded text fields) to resign the first responder status.
             view.endEditing(true)
         }
     
    
}
