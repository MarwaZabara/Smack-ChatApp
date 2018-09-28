//
//  ChatVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/9/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var MenuBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(revealViewController().tapGestureRecognizer())
        if AuthService.instance.IsLoggedIn{
        AuthService.instance.FindUserByEmail { (success) in
            NotificationCenter.default.post(name: Notif_DataChanged, object: nil)
            }}
    }

    

  

}
