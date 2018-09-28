//
//  ChannelVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/9/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var Username: UIButton!
    @IBOutlet weak var UserImg: CircleImg!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(DataChanged), name: Notif_DataChanged, object: nil)
    }

    @IBAction func UnWindFromLoginVC (Segue : UIStoryboardSegue){}
    @IBAction func PrepareForUnWind(Segue : UIStoryboardSegue){}
    
    @IBAction func LoginPressed(_ sender: Any) {
        //Show ProfileVC
        if AuthService.instance.IsLoggedIn == true {
            let Profile = ProfileVC()
            Profile.modalPresentationStyle = .custom
            present(Profile, animated: true, completion: nil)
    
        }
        else {
            //Show LoginVC
            performSegue(withIdentifier: "ToLogin", sender:nil)
        }
    }
    @objc func DataChanged(){
        if AuthService.instance.IsLoggedIn{
        Username.setTitle(DataService.instance.name, for: .normal)
        UserImg.image = UIImage(named: DataService.instance.avatarName)
        UserImg.backgroundColor = DataService.instance.ReturnUIColor(Components:DataService.instance.avatarColor)
        }
        else {
            Username.setTitle("Login", for: .normal)
            UserImg.image = UIImage(named: "menuProfileIcon")
            UserImg.backgroundColor = UIColor.clear
        }
        }

}
