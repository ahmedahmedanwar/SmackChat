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
import Alamofire
import Firebase
import FirebaseAuth
import SVProgressHUD


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
    override func viewWillAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccountBtn(_ button: TransitionButton) {
        
//        //    SVProgressHUD.show()
//
        //FireBase auth
        let userName = userNameTxt

        //     TODO: Set up a new user on our Firbase database

        Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) {
            (user, error) in
            if error != nil {
                //something bad happning
                print(error! )
                self.userAlreadyRegisterd()
            }else{
                //user registered successfully
                print("registration Success")

                Analytics.logEvent("share_image", parameters: [
                    "name": userName!,
                    "avatarName": self.avatarName as NSObject,
                    "avatarColor": self.avatarColor as NSObject
                ])
             self.performSegue(withIdentifier: UNWIND, sender: self)
            }


        }

        Auth.auth().signIn(withEmail: emailTxt.text!, password: passwordTxt.text!) { (user, error) in
            if error != nil {

                print(error!)
            }


        }

//
//        
//                     guard let name = userNameTxt.text , userNameTxt.text != "" else { return }
//                     guard let email = emailTxt.text , emailTxt.text != ""
//                         else {return}
//             
//                     guard let password = passwordTxt.text, passwordTxt.text != ""
//             
//                         else {return}
//             
//                     AuthService.instance.registerUSer(email: email, password: password) { (success) in
//                         if success
//                         {
//             
//                             AuthService.instance.loginUser(email: email, password: password) { (success) in
//                                 if success {
//             
//                                     //          print("logein user!",AuthService.instance.userEmail)
//             
//                                     print("token",AuthService.instance.authToken)
//                                 }
//             
//                                 AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor,                                 completion: { (success) in
//                                     if success {
//                                         print(UserDataService.instance.name, UserDataService.instance.avatarName)
//                                         self.performSegue(withIdentifier: UNWIND, sender: nil)
//                                     }else {
//             
//                                      //   debugPrint(Error.self)
//             
//                                         print("error")
//             
//                                     }
//                                 }
//             
//                             )}
//                         }
//             
//                         }
    }
    
    
    
    @IBAction func chooseAvatarBtn(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PIKER, sender: nil)
    }
    
    
    @IBAction func backGroundBtnPick(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    @IBAction func choosePhotobtn(_ sender: Any) {
        
        performSegue(withIdentifier: "goToPhonePhotos", sender: nil)
        
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    func userAlreadyRegisterd() {
        let alert = UIAlertController(title: "Enter Anew Email", message: "This Email is already registerd", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: " OK ",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func userhasBeenRegistered() {
           let alert = UIAlertController(title: "Congratese ", message: "You has been Registered Successfully", preferredStyle: UIAlertController.Style.alert)
           
           alert.addAction(UIAlertAction(title: " OK ",
                                         style: UIAlertAction.Style.destructive,
                                         handler: {(_: UIAlertAction!) in
                                           //Sign out action
           }))
           
           self.present(alert, animated: true, completion: nil)
           
       }
    
    
}
