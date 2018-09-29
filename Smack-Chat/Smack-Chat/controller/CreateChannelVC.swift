//
//  CreateChannelVC.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/29/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class CreateChannelVC: UIViewController {

    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var DescriptionTxt: UITextField!
    @IBOutlet weak var NameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupView()

        
    }

   
    
    @IBAction func CloseBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func CreateChannelPressed(_ sender: Any) {
        guard let name = NameTxt.text , name != "" else {return}
        guard let desc = NameTxt.text , desc != "" else {return}
        SocketService.instance.AddChannel(ChannelName: name, ChannelDescription: desc) { (sucess) in
            if (sucess){
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func SetupView (){
        let TouchClose = UITapGestureRecognizer(target: self, action: #selector(TapClose))
        BgView.addGestureRecognizer(TouchClose)
        NameTxt.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])
        DescriptionTxt.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedStringKey.foregroundColor:PurplePlaceHolder])

    }
    
    @objc func TapClose (Recognizer : UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
}
