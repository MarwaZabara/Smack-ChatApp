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

//Colors
let PurplePlaceHolder = #colorLiteral(red: 0.5714172125, green: 0.3195958138, blue: 0.7234756351, alpha: 0.5)


//Notifications
let Notif_DataChanged = Notification.Name("NotifDataDidChange")


//users defaults
let TokenKey = "token"
let LoggedInKey = "LoggedIn"
let UserEmail = "UserEmail"
