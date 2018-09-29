//
//  ChannelCell.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/29/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var ChannelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }
        else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }


    func ConfigureCell (Channel : Channel){
        let Title = Channel.channelTitle ?? "cbh"
        ChannelTitle.text = "#\(Title)"

    }

}
