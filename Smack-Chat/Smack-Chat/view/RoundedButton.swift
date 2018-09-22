//
//  RoundedButton.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/20/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var CornerRadius : CGFloat = 3.0{
     didSet{
            self.layer.cornerRadius = CornerRadius
      }
        
   }
    override func awakeFromNib() {
        self.setupView()
    }
    func setupView() {
    self.layer.cornerRadius = CornerRadius
    }
}
