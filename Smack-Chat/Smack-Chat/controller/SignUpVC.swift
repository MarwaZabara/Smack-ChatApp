//
//  ToSignUpVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/19/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//    @IBAction func UnWindToLoginVC(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
//    
    @IBAction func CloseBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UnWind, sender: nil)
    }
    



}
