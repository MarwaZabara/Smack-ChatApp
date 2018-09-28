//
//  ProfileVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/28/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var UserImg: UIImageView!
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @IBOutlet weak var BgView: UIView!
    
    @IBAction func LogoutPressed(_ sender: Any) {
        DataService.instance.UserLogout()
        NotificationCenter.default.post(name: Notif_DataChanged, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ClosePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        UserImg.image = UIImage(named: DataService.instance.avatarName)
         UserEmail.text = DataService.instance.email
        Username .text = DataService.instance.name
      let CloseTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.CloseTap(_:)))
        BgView.addGestureRecognizer(CloseTouch)
        
        
            
    }
    
    @objc func CloseTap(_ Recognizer : UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
