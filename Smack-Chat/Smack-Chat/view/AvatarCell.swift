//
//  AvatarCell.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/23/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

enum AvatarType{
    case dark
    case light
}
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
    func ConfigureCell(index:Int , Type:AvatarType){
        if Type == AvatarType.dark{
            AvatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        else {
            AvatarImg.image=UIImage(named:"light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
}
