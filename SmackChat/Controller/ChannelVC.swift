//
//  ChannelVC.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 90
    }

    
}
