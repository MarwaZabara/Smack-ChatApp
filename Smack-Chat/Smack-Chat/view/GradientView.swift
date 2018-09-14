//
//  GradientView.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/14/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {

    @IBInspectable var TopColor : UIColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1){
    didSet {
    self.setNeedsLayout()
        }}
    
//    @IBInspectable var MidColor : UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1){
//        didSet {
//            self.setNeedsLayout()
//        }}
    @IBInspectable var ButtomColor : UIColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1){
        didSet {
            self.setNeedsLayout()
        }}
   
    override func layoutSubviews() {
        let GradientLayer = CAGradientLayer()
        GradientLayer.colors = [TopColor.cgColor,ButtomColor.cgColor]
        GradientLayer.startPoint = CGPoint(x: 0, y: 0)
        GradientLayer.endPoint = CGPoint(x: 1, y: 1)
        GradientLayer.frame = self.bounds
        self.layer.insertSublayer(GradientLayer, at: 0)
    }

}
