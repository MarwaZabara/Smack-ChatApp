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
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    
    //Variables
    var AvatarName = "profileDefault"
    var AvatarColor = "[0.5,0.5,0.5,1]"
    var BGColor : UIColor?
    
    override func viewDidAppear(_ animated: Bool) {
        if DataService.instance.avatarName != ""{
        AvatarName = DataService.instance.avatarName
        UserImg.image = UIImage(named: AvatarName)
        }
        if AvatarName.contains("light"),BGColor == nil{
            UserImg.backgroundColor = UIColor.lightGray
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetupView()
    }

    @IBAction func ChooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier:ToAvatarPicker, sender: nil)
    }
    
    
    @IBAction func GenerateBGPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        UIView.animate(withDuration: 0.3){
            self.UserImg.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)}
        //DataService.instance.avatarColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
        Spinner.isHidden = false
        Spinner.startAnimating()
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
//                            print("here")
//                            print("ahoo\(DataService.instance.name,DataService.instance.avatarName)")
                                self.Spinner.stopAnimating()
                                self.Spinner.isHidden = true
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
    
    
    func SetupView (){
        Spinner.isHidden = true
        UsernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])
        PswrdTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])
        EmailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])
        let Tap = UITapGestureRecognizer(target: self, action: #selector(HandleTap))
        view.addGestureRecognizer(Tap)
        
        
    }
    @objc func HandleTap(){
        view.endEditing(true)
    }
}


