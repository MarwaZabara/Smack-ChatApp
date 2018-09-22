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
}
