//
//  ChannelVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/9/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func UnWindFromLoginVC (Segue : UIStoryboardSegue){}

}
