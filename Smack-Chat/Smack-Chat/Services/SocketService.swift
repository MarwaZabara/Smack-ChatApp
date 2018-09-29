//
//  SocketService.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/29/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    let manager = SocketManager(socketURL: URL(string:BaseURL)!)
    lazy var socket:SocketIOClient = manager.defaultSocket
    
    func EstablishConnection(){
        socket.connect()
        }
    
    func CloseConnection(){
        socket.disconnect()
    }
    
    func AddChannel(ChannelName:String,ChannelDescription:String,completion :@escaping CompletionHandler){
        socket.emit("newChannel", ChannelName,ChannelDescription)
        completion(true)
    }
    
    func GetChannel(completion : @escaping CompletionHandler){
        socket.on("channelCreated"){ (dataArray,ack) in
            guard let channelName = dataArray[0] as? String else{return}
            guard let channeldesc = dataArray[1] as?  String else{return}
            guard let channelID = dataArray[2] as? String else{return}
            let newChannel = Channel(channelTitle: channelName, channelDescription: channeldesc, channelID: channelID)
            Messageservice.instance.channels.append(newChannel)
            completion(true)

            
        }
    }

    

}
