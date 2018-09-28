//
//  DataService.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/22/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import Foundation

class DataService {

    static let instance = DataService()
    public private(set) var name = ""
    public private(set) var email = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    public private(set) var id = ""
    
    
    func SetUserData(id:String,name:String , email:String , avatarname:String , avatarColor:String){
    self.name = name
    self.email = email
    self.avatarName = avatarname
    self.avatarColor = avatarColor
    self.id = id
    
    }
    func SetAvatarName(Name:String){
        self.avatarName = Name
    }
    
    
    func ReturnUIColor(Components:String)-> UIColor{
        let scanner = Scanner(string: Components)
        let skip = CharacterSet(charactersIn: "[], ")
        let sepearator = CharacterSet(charactersIn: ",")
        let defaultColor = UIColor.lightGray
        scanner.charactersToBeSkipped =  skip
        var r,g,b,a : NSString?
       scanner.scanUpToCharacters(from: sepearator, into: &r)
       scanner.scanUpToCharacters(from: sepearator, into: &g)
       scanner.scanUpToCharacters(from: sepearator, into: &b)
       scanner.scanUpToCharacters(from: sepearator, into: &a)
        
        guard let rUnWrapped = r  else{return defaultColor}
        guard let gUnWrapped = g  else{return defaultColor}
        guard let bUnWrapped = b  else{return defaultColor}
        guard let aUnWrapped = a  else{return defaultColor}
        
        let rfloat = CGFloat(rUnWrapped.doubleValue)
        let gfloat = CGFloat(gUnWrapped.doubleValue)
        let bfloat = CGFloat(bUnWrapped.doubleValue)
        let afloat = CGFloat(aUnWrapped.doubleValue)
        
        let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        return newUIColor
        
    }
    
    func UserLogout (){
        name = ""
        email = ""
        avatarName = ""
        avatarColor = ""
        id = ""
        AuthService.instance.AuthToken = ""
        AuthService.instance.Email = ""
        AuthService.instance.IsLoggedIn = false
    }
    
    
    
    
    
}
