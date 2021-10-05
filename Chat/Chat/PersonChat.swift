//
//  ChatModel.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import Foundation

struct PersonChat {
    var name: String
    var messages: [Message?]
    var online: Bool
    var hasUnreadMessages: Bool
    var profileImage: String?
    
    
   static func getPersonChat() -> [PersonChat] {
        
    [PersonChat(name: "Anton", messages: [Message(messagetext: "Hello, Bro", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "bbnnnmmmmnmmmmnbvv", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "How are you!jhihugigigugiugiuiguiguigigiggigigigigigigigigigigigigigigbhgyugyuigyigyigyigyigygiygiyigigigi", dateOfCreation: Date(), isIncomming: false), Message(messagetext: "jfkfdld;", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: false, profileImage: nil),
     PersonChat(name: "Kolya", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
     PersonChat(name: "Ivan", messages: [Message(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "No, sorry, I did not", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
     PersonChat(name: "Karina", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
     PersonChat(name: "Masha", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
     
     PersonChat(name: "Anton", messages: [Message(messagetext: "Hello, Bro", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: false, profileImage: nil),
      PersonChat(name: "Kolya", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
      PersonChat(name: "Ivan", messages: [Message(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "No, sorry, I did not", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
      PersonChat(name: "Karina", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
      PersonChat(name: "Masha", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
      
      PersonChat(name: "Anton", messages: [Message(messagetext: "Hello, Bro", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: false, profileImage: nil),
       PersonChat(name: "Kolya", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
       PersonChat(name: "Ivan", messages: [Message(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "No, sorry, I did not", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
       PersonChat(name: "Karina", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
       PersonChat(name: "Masha", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
       
       PersonChat(name: "Anton", messages: [Message(messagetext: "Hello, Bro", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: false, profileImage: nil),
        PersonChat(name: "Kolya", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -686787), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -686787), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
        PersonChat(name: "Ivan", messages: [Message(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true), Message(messagetext: "No, sorry, I did not", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
        PersonChat(name: "Karina", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: true, hasUnreadMessages: true, profileImage: nil),
        PersonChat(name: "Masha", messages: [Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -879798), isIncomming: true), Message(messagetext: "How are you, man?", dateOfCreation: Date(), isIncomming: false)], online: false, hasUnreadMessages: true, profileImage: nil),
     
        ]
    }
}

struct Message {
    var messagetext: String
    var dateOfCreation: Date
    var isIncomming: Bool
}

