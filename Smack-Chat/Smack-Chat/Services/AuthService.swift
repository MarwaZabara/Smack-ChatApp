//
//  AuthService.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/20/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
                print("registration done")
                Completion(true)
            }
            else {
                Completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    func LoginUser (Email:String,Password:String,Completion: @escaping CompletionHandler){
        let LowerCaseEmail = Email.lowercased()
      
        
        let Body :[String:Any] = [
            "email" : LowerCaseEmail,
            "password" : Password
        ]
        
        Alamofire.request(URLLogin, method: .post, parameters: Body, encoding: JSONEncoding.default, headers: Header).responseJSON { (response) in
            if response.result.error == nil {
              //  print(response)
//                if let json = response.result.value as? Dictionary<String,Any>{
//                    if  let Email = json["user"] as? String{
//                        self.Email = Email
//                    }
//                    if let Token = json["token"] as? String{
//                        self.AuthToken = Token
//                    }
//                }
                guard let data = response.data
                    else {return}
                do{let json = try JSON(data:data)
                self.Email = json["user"].stringValue
                    self.AuthToken = json["token"].stringValue}
                catch {
                    print("error")
                }
                Completion(true)
                self.IsLoggedIn=true
            }
            else {
                Completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    func AddUser (Name:String,Email:String,AvatarName:String,AvatarColor:String,Completion: @escaping CompletionHandler){
        let LowerCaseEmail = Email.lowercased()
       
        
        let Body :[String:Any] = [
            "name" : Name,
            "email" : LowerCaseEmail,
            "avatarName" : AvatarName,
            "avatarColor" : AvatarColor
        ]
        
         Alamofire.request(URLAdd, method: .post, parameters: Body, encoding: JSONEncoding.default, headers: BEARER_Header).responseJSON { (response) in
            if response.result.error == nil
            {
                guard let data = response.data
                    else{return}
                self.SetUserInfo(data:data)
                Completion(true)
            }
            
            else{
                Completion(false)
                debugPrint(response.result.error as Any)}
        }}
        
    func FindUserByEmail(completion : @escaping CompletionHandler){
        Alamofire.request("\(URL_FIND_BY_EMAIL)\(Email)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_Header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                self.SetUserInfo(data: data)
               print ("user info found")
                    completion(true)
                
                }
            else {
                print ("user info NOT found")
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    func SetUserInfo(data: Data){
       do{
        let json = try JSON(data:data)
        let id = json["_id"].stringValue
        let color = json["avatarColor"].stringValue
        let avatarName = json["avatarName"].stringValue
        let name = json["name"].stringValue
        let email = json["email"].stringValue
        DataService.instance.SetUserData(id: id, name: name, email: email, avatarname: avatarName, avatarColor: color)
        print ( "Info WELL set")
        }
        catch {
            print ("INfo not set")
            return}
    }
    
}


