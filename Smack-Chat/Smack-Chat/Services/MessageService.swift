//
//  MessageService.swift
//  Smack-Chat
//
//  Created by Marwa Zabara on 9/28/18.
//  Copyright © 2018 Marwa Zabara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Messageservice {
    static let instance = Messageservice()
    var channels = [Channel]()
    
    func FindAllChannels (completion : @escaping CompletionHandler){
        Alamofire.request(GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_Header).responseJSON { (response) in
            if response.result.error == nil{
                guard let data = response.data else {return}
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                }
//                catch let error {
//                    debugPrint(error as Any)
//                }
//                print (self.channels)
                if let json = JSON(data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let description = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTitle:name,channelDescription:id,channelID:description)
                        self.channels.append(channel)
                    }
                    print (self.channels)
                    completion(true)

                }
            }
            else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    
    
}
