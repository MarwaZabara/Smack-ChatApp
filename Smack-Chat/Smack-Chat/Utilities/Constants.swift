//
//  File.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/19/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success:Bool) ->()

//URL
let BaseURL = "https://chatty-chatapp.herokuapp.com/v1/"
let URLRegister = "\(BaseURL)account/register"
let URLLogin = "\(BaseURL)account/login"
let URLAdd = "\(BaseURL)user/add"
//Segues
let To_Signup = "ToSignUp"
let UnWind = "UnWindToChannel"
let ToAvatarPicker = "ToAvatarPicker"


//users defaults
let TokenKey = "token"
let LoggedInKey = "LoggedIn"
let UserEmail = "UserEmail"
