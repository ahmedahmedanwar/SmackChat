//
//  CreatAccountVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class CreatAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeBtnPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
