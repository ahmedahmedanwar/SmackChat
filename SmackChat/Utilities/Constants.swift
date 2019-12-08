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

let BASE_URL = "https://chattingslack.herokuapp.com /v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"

//Segues

let TO_LOGIN = "toLogin"

let To_CreateAccount = "gotoCreateAccount"
let UNWIND = "goBackToChannelVC"

//userdefaults

let TOKEN_KEY = "tokenkey"
let LOGGED_IN_KEY = "logedin"
let USER_EMAIL = "useremail"


//Headers

let HEADER = [
          "Content-Type": "applecation/json; charest=utf-8"
      ]

