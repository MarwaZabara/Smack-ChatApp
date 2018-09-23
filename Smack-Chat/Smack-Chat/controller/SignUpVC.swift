//
//  ToSignUpVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/19/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    //IBOutlets
//    @IBOutlet weak var UsernameTxt: UITextField!
//    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var PswrdTxt: UITextField!
    @IBOutlet weak var UserImg: UIImageView!
    
    //Variables
    var AvatarName = "profileDefault"
    var AvatarColor = "[0.5,0.5,0.5,1]"
    
    override func viewDidAppear(_ animated: Bool) {
        if DataService.instance.avatarName != ""{
        AvatarName = DataService.instance.avatarName
        UserImg.image = UIImage(named: AvatarName)
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func ChooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier:ToAvatarPicker, sender: nil)
    }
    
    
    @IBAction func GenerateBGPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
        guard let Username = UsernameTxt.text , Username != "" else {return}
        print("username is \(Username)\n")
        guard let Email = EmailTxt.text , EmailTxt.text != "" else {return}
        print("email is\(Email)\n")
        guard  let Password = PswrdTxt.text , PswrdTxt.text != "" else {return}
        print("password is\(Password)\n")
        print("Avatar name is \(AvatarName)")
        AuthService.instance.RegisterUser(Email: Email, Password: Password) { (success) in
            if (success) {
                print("Yeeah succeeded!")
                print(DataService.instance.email,DataService.instance.avatarName)
                AuthService.instance.LoginUser(Email: Email,Password: Password){(sucess) in
                    if (sucess){
                        print("Successfuly loggedin!!",AuthService.instance.AuthToken)
                        AuthService.instance.AddUser(Name: Username, Email: Email, AvatarName: self.AvatarName, AvatarColor: self.AvatarColor) {
                            (success) in
                            if(sucess){
                            print("here")
                            print("ahoo\(DataService.instance.name,DataService.instance.avatarName)")
                            self.performSegue(withIdentifier:UnWind, sender: nil)
                            
                            
                            }else {print("error")}
                            }
                    }else {print("error")}
                }
            }else {print("error")}
        }
        
    }
    
    
    @IBAction func CloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UnWind, sender: nil)
    }
    

}


