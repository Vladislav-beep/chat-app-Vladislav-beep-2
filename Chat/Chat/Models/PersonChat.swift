//
//  ChatModel.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import Foundation

struct PersonChat {
    var name: String
    var messages: [MessageUser?]
    var online: Bool
    var hasUnreadMessages: Bool
    var profileImage: String?
    
   static func getPersonChat() -> [PersonChat] {
        
    [
        PersonChat(name: "Elon Muskhdrctucicciciciycycycyiyci",
                   messages: [
                    MessageUser(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably.", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "And why?", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Just at night? What are you, at home you’re doing this?", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think. It’s like maybe 10-15 minutes or something.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Yeah, well people pay attention when you do that.", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "Yeah. It’s pretty interesting what my most",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Not really. I think it’s mostly just if it’s something that might cause.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Do you consider it a communications medium? How do you look at it?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "How are you!",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "Some people use their hair to express themselves. I use Twitter.", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "You pick fights with the press over Twitter, and then you have all your fans",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "Explain that, please.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "The amount of untruthful stuff that is written is unbelievable. Take that Wall Street Journal.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I get that, but do you understand the mood.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "The answer is for the press to be honest and truthful, and research their articles.",
                            dateOfCreation: Date(),
                            isIncomming: false)
                   ],
                   online: true,
                   hasUnreadMessages: false,
                   profileImage: nil),
        
     PersonChat(name: "Kolya Konovalov",
                messages: [
                    MessageUser(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    MessageUser(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -30000), isIncomming: false)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Ronald Robertson",
                messages: [
                    MessageUser(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "No, sorry, I did not", dateOfCreation: Date(timeIntervalSinceNow: -30000), isIncomming: false)],
                online: true,
                hasUnreadMessages: true,
                profileImage: nil),
        
     PersonChat(name: "Karina Gromova",
                messages: [
                    MessageUser(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    MessageUser(messagetext: "How are you, darling?", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Masha Ryshova",
                messages: [
                    MessageUser(messagetext: "What do you think of that? Are you worried about unleashing a dangerous cycle that a lot of the Justifiably.",
                            dateOfCreation: Date(timeIntervalSinceNow: -300000),
                            isIncomming: true),
                    MessageUser(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
        PersonChat(name: "Jeff Bezos",
                   messages: [
                    MessageUser(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably with not much of a filter.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "And why?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Just at night? What are you, at home you’re doing this?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Yeah, well people pay attention when you do that.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Yeah. It’s pretty interesting what my most.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "What about the things they didn’t love?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Not really. I think it’s mostly just if it’s something that might cause a substantial movement.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Do you consider it a communications medium? How do you look at it?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "How are you!",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Some people use their hair to express themselves. I use Twitter.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "You pick fights with the press over Twitter, and then you have all your fans, of which there are many.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Explain that, please.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "The amount of untruthful stuff that is written is unbelievable.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I get that, but do you understand the mood in this country around the press.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "The answer is for the press to be honest and truthful, and research their articles.",
                            dateOfCreation: Date(timeIntervalSinceNow: -300000),
                            isIncomming: false)
                   ],
                   online: true,
                   hasUnreadMessages: false,
                   profileImage: nil),
     PersonChat(name: "Ivan Chernov",
                messages: [nil],
                online: true,
                hasUnreadMessages: true,
                profileImage: nil),
     PersonChat(name: "Jonny watson",
                messages: [
                    MessageUser(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    MessageUser(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: false),
                MessageUser(messagetext: "I am fine and you?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: true)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
     PersonChat(name: "Marta Kraig",
                messages: [nil],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
     PersonChat(name: "Artur Bell",
                messages: [
                    MessageUser(messagetext: "What do you think of that? Are you worried about unleashing",
                            dateOfCreation: Date(timeIntervalSinceNow: -300000),
                            isIncomming: true),
                    MessageUser(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -10000000),
                            isIncomming: false)],
                online: true,
                hasUnreadMessages: true,
                profileImage: nil),
        
        PersonChat(name: "Grigoriy Maslov",
                   messages: [
                    MessageUser(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter, too, and an addiction.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably with not much of a filter.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "And why?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Just at night? What are you, at home you’re doing this?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Yeah, well people pay attention when you do that.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Yeah. It’s pretty interesting what my most ...",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that? Is that correct?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Not really. I think it’s mostly just if it’s something that might cause",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Do you consider it a communications medium? How do you look at it?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "How are you!",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Some people use their hair to express themselves. I use Twitter.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "You pick fights with the press over Twitter.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Explain that, please.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "The amount of untruthful stuff that is written is unbelievable.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I get that, but do you understand the mood in this country around the press and the dangers of attacking.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "The answer is for the press to be honest",
                            dateOfCreation: Date(),
                            isIncomming: false)
                   ],
                   online: false,
                   hasUnreadMessages: false,
                   profileImage: nil),
        
     PersonChat(name: "Nikita Kolesov",
                messages: [
                    MessageUser(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    MessageUser(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -30000), isIncomming: false)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Morris Henrey",
                messages: [
                    MessageUser(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "No, sorry, I did not", dateOfCreation: Date(timeIntervalSinceNow: -40000), isIncomming: false)],
                online: false,
                hasUnreadMessages: true,
                profileImage: nil),
        
     PersonChat(name: "Irma Flores",
                messages: [
                    MessageUser(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    MessageUser(messagetext: "How are you, darling?", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Collin Williams",
                messages: [
                    MessageUser(messagetext: "What do you think of that? Are you worried about unleashing a dangerous cycle that", dateOfCreation:
                                Date(timeIntervalSinceNow: -300000),
                            isIncomming: true),
                    MessageUser(messagetext: "I suggest the press take it to heart and do better.",
                            dateOfCreation: Date(timeIntervalSinceNow: -300000),
                            isIncomming: false)
                ],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
        PersonChat(name: "Oliver Flinn",
                   messages: [
                    MessageUser(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    MessageUser(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I tweet interesting things pretty much as they come to me.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "And why?", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Just at night? What are you, at home you’re doing this?", dateOfCreation: Date(), isIncomming: true),
                    MessageUser(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Yeah, well people pay attention when you do that.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Yeah. It’s pretty interesting what my most ...",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Not really. I think it’s mostly just if it’s something that might cause",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Do you consider it a communications medium? How do you look at it?",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "How are you!",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Some people use their hair to express themselves. I use Twitter.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "You pick fights with the press over Twitter,",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "Explain that, please.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "The amount of untruthful stuff that is written is unbelievable.",
                            dateOfCreation: Date(),
                            isIncomming: true),
                    MessageUser(messagetext: "I get that, but do you understand the mood in this country around the press and the dangers of attacking.",
                            dateOfCreation: Date(),
                            isIncomming: false),
                    MessageUser(messagetext: "The answer is for the press to be honest and truthful.",
                            dateOfCreation: Date(timeIntervalSinceNow: -300000),
                            isIncomming: false)
                   ],
                   online: false,
                   hasUnreadMessages: false,
                   profileImage: nil),
     PersonChat(name: "Jane Warren",
                messages: [nil],
                online: false,
                hasUnreadMessages: true,
                profileImage: nil),
     PersonChat(name: "John Crane",
                messages: [
                    MessageUser(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    MessageUser(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: false),
                MessageUser(messagetext: "I am fine and you?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: true)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
     PersonChat(name: "King Artur",
                messages: [
                    MessageUser(messagetext: "What do you think of that? Are you worried about unleashing a dangerous",
                            dateOfCreation: Date(timeIntervalSinceNow: -300000),
                            isIncomming: true),
                    MessageUser(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -10000000), isIncomming: false)],
                online: false,
                hasUnreadMessages: true,
                profileImage: nil)
        ]
    }
}

struct MessageUser {
    var messagetext: String
    var dateOfCreation: Date
    var isIncomming: Bool
}
