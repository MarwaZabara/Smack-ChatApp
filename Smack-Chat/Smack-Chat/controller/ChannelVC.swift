//
//  ChannelVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/9/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController , UITableViewDelegate,UITableViewDataSource{
   
 

    @IBOutlet weak var ChannelTableView: UITableView!
    @IBOutlet weak var Username: UIButton!
    @IBOutlet weak var UserImg: CircleImg!
    override func viewDidLoad() {
        super.viewDidLoad()
        ChannelTableView.delegate = self
        ChannelTableView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(DataChanged), name: Notif_DataChanged, object: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        SetupUserInfo()
    }

    @IBAction func UnWindFromLoginVC (Segue : UIStoryboardSegue){}
    @IBAction func PrepareForUnWind(Segue : UIStoryboardSegue){}
    
    @IBAction func AddChannelPressed(_ sender: Any) {
        let addChannel = CreateChannelVC()
        addChannel.modalPresentationStyle = .custom
        present(addChannel, animated: true)
    }
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
        SetupUserInfo()
        }
    
    func SetupUserInfo(){
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messageservice.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = ChannelTableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell{
            let channel = Messageservice.instance.channels[indexPath.row]
            cell.ConfigureCell(Channel:channel)
            return cell}
        else {return ChannelCell() }
    }
    
    
}
