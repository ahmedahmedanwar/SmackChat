//
//  AuthenticateServices.swift
//  SmackChat
//
//  Created by Ahmed on 12/6/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService ()
    
    let defaults = UserDefaults.standard
    
    var isLogedin :Bool {
        
        get {
            
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set{
            
            return defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    
    var authToken:String  {
        
        get {
            
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            
            return defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        
        
        get {
            
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            
            return defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    //**************************
    
    // Mark -> functions
    
    func registerUSer (email: String , password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        
        let body:[String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        
      
        Alamofire.request(  URL_REGISTER, method: .get, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                
                completion (true)
            }else {
                
                completion (false)
                print(response.request as Any)  // original URL request
                           print(response.response as Any) // URL response
                           print(response.result.value as Any)   // result of response serialization

                           debugPrint(response)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    func loginUser (email: String , password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        
        
        let body:[String: Any] = [
            "email" : lowerCaseEmail,
            "password" : password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil{
                
                // Manual Patsing ->
                
                //                if let  json = response.result.value as?
                //                    Dictionary<String, Any >
                //                {
                //                    if let email = json["user"] as? String{
                //                        self.userEmail = email
                //                    }
                //                    if let token = json["token"] as? String {
                //                    self.authToken = token
                //                    }
                //                }
                
                //Using SwiftyJSON parsing
                
                guard let data =  response.data else {return}
                do{
                    let json = try JSON(data : data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue
                    
                }catch{
                    print("error")
                }
                self.isLogedin = true
                completion (true)
                
                
            }else{
                completion (false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization":"Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                do{  let json = try JSON(data: data)
                    
                    let id = json["_id"].stringValue
                    let color = json["avatarColor"].stringValue
                    let avatarName = json["avatarName"].stringValue
                    let email = json["email"].stringValue
                    let name = json["name"].stringValue
                    
                    UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                    completion(true)
                }catch{
                    print("error")
                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
}
