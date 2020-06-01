//
//  CreatAccountVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import Alamofire
import Firebase
import FirebaseAuth


class CreatAccountVC: UIViewController {
    
    
    // Variables
    var avatarName1 =  ""
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var userName = ""
    var pass = ""
    var email = ""
    //var bgColor  = UIColor?.self
    var flag1 = false
    
    @IBOutlet weak var createAccountBtnoutlet: UIButton!
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPView()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        setuserImage()
        
        //
        //              let channelVC = self.storyboard?.instantiateViewController(withIdentifier: "ChannelVC") as! ChannelVC
        //
        //        if flag1 == true{
        //
        //            channelVC.imageAvatar2 = (named: avatarName1)
        //        }
        //
        //        presentingViewController(ChannelVC, animated: true)
    }
    
    
    @IBAction func createAccountBtn(_ button: UIButton) {
        
        spiner.isHidden = false
        spiner.startAnimating()
        
        let userName = userNameTxt
        //        let email = emailTxt
        //        let password = passwordTxt
        //     TODO: Set up a new user on our Firbase database
        
        Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text! ) {
            (success, error) in
            if error != nil {
                
                //  self.userAlreadyRegisterd()
                
                
                Analytics.logEvent("share_image", parameters: [
                    "name": userName!,
                    "avatarName": self.avatarName as NSObject,
                    "avatarColor": self.avatarColor as NSObject
                ])
                
                
            }else if success != nil{
                //user registered successfully
                self.userhasBeenRegistered()
                self.spiner.stopAnimating()
                self.spiner.isHidden = true
                
            }
            
            self.performSegue(withIdentifier: UNWIND, sender: self)
            
            //notification after user regester successfully
            
            NotificationCenter.default.post(name: NOTIFY_USER_DATA_DID_CHANGED, object: nil)
        }
        
//        Auth.auth().signIn(withEmail: emailTxt.text!, password: passwordTxt.text!) { (user, error) in
//            if error != nil {
//
//            }
//        }
//
        // Mark ->  Server Code ***************************
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
        //  }*****************************
    }
    
    @IBAction func chooseAvatarBtn(_ sender: Any) {
        
        performSegue(withIdentifier: TO_AVATAR_PIKER, sender: nil)
        
    }
    
    @IBAction func backGroundBtnPick(_ sender: Any) {
        
        self.userImage.backgroundColor = UIColor.random()
        
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
        let alert = UIAlertController(title: "Enter Avalid Email", message: "This Email is already registerd or unknown email", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: " OK ",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func userhasBeenRegistered() {
        let alert = UIAlertController(title: "Congrates ", message: "You have been Registered Successfully", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: " OK ",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        //Sign out action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func setuserImage(){
        
        if   avatarName1 != "" {
            
            userImage.image =  UIImage( named: avatarName1)
        }
    }
    
    func setBgcolor(){
        
        self.view.backgroundColor = .random()
    }
    
    func setUPView (){
        
        spiner.isHidden = true
        
        userNameTxt.attributedPlaceholder = NSAttributedString( string: "userName", attributes: [NSAttributedString.Key.foregroundColor: smackPurblePlaceholder])
        
        emailTxt.attributedPlaceholder = NSAttributedString( string: "email", attributes: [NSAttributedString.Key.foregroundColor: smackPurblePlaceholder])
        
        passwordTxt.attributedPlaceholder = NSAttributedString( string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurblePlaceholder])
        
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

