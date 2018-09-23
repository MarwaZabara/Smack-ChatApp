//
//  CircleImg.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/23/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class CircleImg: UIImageView {

    override func awakeFromNib() {
        SetupView()
        
    }
    
    func SetupView(){
        self.layer.cornerRadius = (self.frame.width) / 2
        self.clipsToBounds = true
    }

}
