//
//  Constants.swift
//  SmackChat
//
//  Created by Ahmed on 11/25/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success : Bool) -> ()


//URL's

//let BASE_URL = "https://chattingslack2.herokuapp.com/v1/"
//let BASE_URL = "http://localhost:3005/v1/"
let BASE_URL = "https://chattingslack2.herokuapp.com/v1/"

let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD =  "\(BASE_URL)user/add"


//Segues

let TO_LOGIN = "toLogin"
let To_CreateAccount = "gotoCreateAccount"
let UNWIND = "goBackToChannelVC"
let TO_AVATAR_PIKER = "toAvatarPiker"
let GO_TO_PHONE_PHOTOS = "goToPhonePhotos"


//userdefaults

let TOKEN_KEY = "tokenkey"
let LOGGED_IN_KEY = "logedin"
let USER_EMAIL = "useremail"

//Headers

let HEADER = [
          "Content-Type": "applecation/json; charest=utf-8"
      ]

// Colors ->

let smackPurblePlaceholder = #colorLiteral(red: 0.2375660211, green: 0.4322183099, blue: 0.6264854754, alpha: 0.5)

// Notification

let  NOTIFY_USER_DATA_DID_CHANGED = Notification.Name("notifyUserdataChanged")
 
