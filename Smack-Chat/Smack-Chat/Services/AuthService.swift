//
//  AuthService.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/20/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    static let instance = AuthService()
    
    let defaults=UserDefaults.standard
    
    var IsLoggedIn : Bool{
        get{
            return defaults.bool(forKey: LoggedInKey)
        }
        set{
            defaults.set(newValue, forKey: LoggedInKey)
        }
    }
    
    
    var AuthToken : String {
        get{
            return defaults.value(forKey: TokenKey) as! String
        }
        set{
            defaults.set(newValue, forKey: TokenKey)
        }
    }
    
    
    var Email : String {
        get{
            return defaults.value(forKey: UserEmail) as! String
        }
        set{
            defaults.set(newValue, forKey: UserEmail)
        }
    }
    
    func RegisterUser (Email:String,Password:String,Completion: @escaping CompletionHandler){
        let LowerCaseEmail = Email.lowercased()
        let Header = [
            "content-type": "application/json; charset=utf-8"
        ]
        
        let Body :[String:Any] = [
            "email" : LowerCaseEmail,
            "password" : Password
        ]

        Alamofire.request(URLRegister, method: .post, parameters: Body, encoding: JSONEncoding.default, headers: Header).responseString { (response) in
            if response.result.error == nil {
                Completion(true)
            }
            else {
                Completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
}
