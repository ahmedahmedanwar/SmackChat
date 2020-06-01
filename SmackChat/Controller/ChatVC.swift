//
//  ChatVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    // Outlets
    
    @IBOutlet weak var manuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(animated:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
  
    
    }
  

}
