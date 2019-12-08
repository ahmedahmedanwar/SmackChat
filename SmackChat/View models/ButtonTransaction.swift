//
//  ButtonTransaction.swift
//  SmackChat
//
//  Created by Ahmed on 12/7/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import UIKit
import TransitionButton

class ButtonTransaction: UIViewController {


        let button = TransitionButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40)) // please use Autolayout in real project
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.addSubview(button)
            
            button.backgroundColor = .red
            button.setTitle("button", for: .normal)
            button.cornerRadius = 20
            button.spinnerColor = .white
            button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        }
        
        @IBAction func buttonAction(_ button: TransitionButton) {
            button.startAnimation() // 2: Then start the animation when the user tap the button
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                
                sleep(3) // 3: Do your networking task or background work here.
                
                DispatchQueue.main.async(execute: { () -> Void in
                    // 4: Stop the animation, here you have three options for the `animationStyle` property:
                    // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                    // .shake: when you want to reflect to the user that the task did not complete successfly
                    // .normal
                    button.stopAnimation(animationStyle: .expand, completion: {
                        let secondVC = UIViewController()
                        self.present(secondVC, animated: true, completion: nil)
                    })
                })
            })
        }
    }
  
