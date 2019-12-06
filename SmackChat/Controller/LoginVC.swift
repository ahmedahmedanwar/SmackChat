//
//  LoginVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func creatAccountBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: To_CreateAccount, sender: nil)
    }
    
}
