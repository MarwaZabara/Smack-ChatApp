//
//  LoginVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/19/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func SignUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: To_Signup , sender: nil)
    }

//    @IBAction func UnWindFromSignUpVC(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
}
