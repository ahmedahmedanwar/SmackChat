//
//  CurrentUserFirebase.swift
//  SmackChat
//
//  Created by Ahmed on 12/26/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import Foundation

struct CurrentUser {
    
    let uid : String
    let email : String
    let name : String
    let userImageURL: String
    
    init(uid: String ,dictionary:[String: Any] ){
        	        self.uid = uid
        self.email = dictionary["email"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.userImageURL = dictionary["userImageURL"] as? String ?? ""

    }
    
}
