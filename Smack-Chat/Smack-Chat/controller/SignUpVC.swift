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
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PswrdTxt: UITextField!
    @IBOutlet weak var UserImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func ChooseAvatarPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func GenerateBGPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func CreateAccountPressed(_ sender: Any) {
        guard let Email = EmailTxt.text , EmailTxt.text != ""
        else {return}
        guard  let Password = PswrdTxt.text , PswrdTxt.text != ""
        else {return}
        AuthService.instance.RegisterUser(Email: Email, Password: Password) { (success) in
            if success {
                print("Yeeah succeeded!")
            }
        }
        
    }
    
    
    @IBAction func CloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UnWind, sender: nil)
    }
    



}
