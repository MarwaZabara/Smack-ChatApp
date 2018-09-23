//
//  AvatarCell.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/23/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    @IBOutlet weak var AvatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupView()
    }
    func SetupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
    }
}
