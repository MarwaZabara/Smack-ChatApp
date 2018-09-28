//
//  LoginVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/19/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()

  
    }
    @IBAction func LoginBtnPressed(_ sender: Any) {
        Spinner.isHidden = false
        Spinner.startAnimating()
        guard let email = EmailTxt.text , email != ""  else {return}
        guard let Password = PasswordTxt.text , Password != ""  else {return}
        AuthService.instance.LoginUser(Email: email, Password: Password) { (success) in
            if(success){
                print ("success login")
                AuthService.instance.FindUserByEmail(completion: { (sucess) in
                    if (success){
                        print ("success login and found")
                        NotificationCenter.default.post(name:Notif_DataChanged, object: nil)
                        self.Spinner.isHidden = true
                        self.Spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
        


        
    }
    
    
    
    
    @IBAction func SignUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: To_Signup , sender: nil)
    }

//    @IBAction func UnWindFromSignUpVC(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
    func SetupView(){
        Spinner.isHidden = true
        Spinner.isHidden = true
        EmailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])
        PasswordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])
  
    }
    
}
