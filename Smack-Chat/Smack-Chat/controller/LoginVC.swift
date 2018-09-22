//
//  LoginVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/19/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    @IBAction func LoginBtnPressed(_ sender: Any) {
        guard let Email = Email.text , Email != ""
            else {return}
        guard let Password = Password.text , Password != ""
            else {return}
        AuthService.instance.LoginUser(Email: Email,Password: Password){(sucess) in
            if (sucess){
                print("Successfuly loggedin!!")
            }
        }
        
    }
    
    
    
    
    @IBAction func SignUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: To_Signup , sender: nil)
    }

//    @IBAction func UnWindFromSignUpVC(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
}
