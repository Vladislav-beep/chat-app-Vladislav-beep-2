//
//  Channel.swift
//  Chat
//
//  Created by Владислав Сизонов on 25.10.2021.
//

import Foundation
import Firebase

struct Channel {
    let identifier: String
    var name: String
    let lastMessage: String
    let lastActivity: Date?
}

struct Message {
    let content: String
    let created: Date
    let senderId: String
    let senderName: String
}

extension Message {
    
    var toDict: [String: Any] {
        return ["content": content,
                "created": Timestamp(date: created),
                "senderID": senderId,
                "senderName": senderName]
    }
}
