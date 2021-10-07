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
        
    [
        PersonChat(name: "Elon Musk",
                   messages: [
                    Message(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter, too, and an addiction. What happens with you and Twitter?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably with not much of a filter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "And why?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Just at night? What are you, at home you’re doing this?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think. It’s like maybe 10-15 minutes or something.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Yeah, well people pay attention when you do that.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. It’s pretty interesting what my most ... What people are most interested in, like some little tweet about “I love anime.” That was it. But it was lowercase “i”, black heart, “anime,” and people loved that. That was like one of my most popular tweets.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that? Is that correct? Will you be? Will you have to change your Twitter behavior?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Not really. I think it’s mostly just if it’s something that might cause a substantial movement in the stock during trading hours. That’s about it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Do you consider it a communications medium? How do you look at it?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening. It feels like dipping into the flow of consciousness of society. That’s what it feels like. It’s kinda weird. I guess I sometimes use Twitter to express myself, and that’s a weird thing to do, I suppose.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Some people use their hair to express themselves. I use Twitter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "You pick fights with the press over Twitter, and then you have all your fans, of which there are many. Are you aware of what they do once you start them off?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Explain that, please.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "The amount of untruthful stuff that is written is unbelievable. Take that Wall Street Journal front-page article about, like, “The FBI is closing in.” That is utterly false. That’s absurd. To print such a falsehood on the front page of a major newspaper is outrageous. Like, why are they even journalists? They’re terrible. Terrible people.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I get that, but do you understand the mood in this country around the press and the dangers of attacking, especially when the president is doing that? In quite an aggressive, “enemy of the state” and everything else. It’s disturbing when someone like you as a leader does that, too, or goes along with it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "The answer is for the press to be honest and truthful, and research their articles and correct things properly when they are false. Which they don’t do.", dateOfCreation: Date(), isIncomming: false)
                   ],
                   online: true,
                   hasUnreadMessages: false,
                   profileImage: nil),
        
     PersonChat(name: "Kolya Konovalov",
                messages: [
                    Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    Message(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -30000), isIncomming: false)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Ronald Robertson",
                messages: [
                    Message(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "No, sorry, I did not", dateOfCreation: Date(timeIntervalSinceNow: -30000), isIncomming: false)],
                online: true,
                hasUnreadMessages: true,
                profileImage: nil),
        
     PersonChat(name: "Karina Gromova",
                messages: [
                    Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    Message(messagetext: "How are you, darling?", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Masha Ryshova",
                messages: [
                    Message(messagetext: "What do you think of that? Are you worried about unleashing a dangerous cycle that a lot of the press are worried about? Justifiably.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    Message(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: true,
                hasUnreadMessages: false,
                profileImage: nil),
        PersonChat(name: "Jeff Bezos",
                   messages: [
                    Message(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter, too, and an addiction. What happens with you and Twitter?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably with not much of a filter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "And why?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Just at night? What are you, at home you’re doing this?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think. It’s like maybe 10-15 minutes or something.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Yeah, well people pay attention when you do that.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. It’s pretty interesting what my most ... What people are most interested in, like some little tweet about “I love anime.” That was it. But it was lowercase “i”, black heart, “anime,” and people loved that. That was like one of my most popular tweets.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that? Is that correct? Will you be? Will you have to change your Twitter behavior?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Not really. I think it’s mostly just if it’s something that might cause a substantial movement in the stock during trading hours. That’s about it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Do you consider it a communications medium? How do you look at it?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening. It feels like dipping into the flow of consciousness of society. That’s what it feels like. It’s kinda weird. I guess I sometimes use Twitter to express myself, and that’s a weird thing to do, I suppose.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Some people use their hair to express themselves. I use Twitter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "You pick fights with the press over Twitter, and then you have all your fans, of which there are many. Are you aware of what they do once you start them off?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Explain that, please.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "The amount of untruthful stuff that is written is unbelievable. Take that Wall Street Journal front-page article about, like, “The FBI is closing in.” That is utterly false. That’s absurd. To print such a falsehood on the front page of a major newspaper is outrageous. Like, why are they even journalists? They’re terrible. Terrible people.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I get that, but do you understand the mood in this country around the press and the dangers of attacking, especially when the president is doing that? In quite an aggressive, “enemy of the state” and everything else. It’s disturbing when someone like you as a leader does that, too, or goes along with it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "The answer is for the press to be honest and truthful, and research their articles and correct things properly when they are false. Which they don’t do.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)
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
                    Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    Message(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: false),
                Message(messagetext: "I am fine and you?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: true)],
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
                    Message(messagetext: "What do you think of that? Are you worried about unleashing a dangerous cycle that a lot of the press are worried about? Justifiably.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    Message(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -10000000), isIncomming: false)],
                online: true,
                hasUnreadMessages: true,
                profileImage: nil),
        
        PersonChat(name: "Grigoriy Maslov",
                   messages: [
                    Message(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter, too, and an addiction. What happens with you and Twitter?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably with not much of a filter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "And why?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Just at night? What are you, at home you’re doing this?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think. It’s like maybe 10-15 minutes or something.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Yeah, well people pay attention when you do that.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. It’s pretty interesting what my most ... What people are most interested in, like some little tweet about “I love anime.” That was it. But it was lowercase “i”, black heart, “anime,” and people loved that. That was like one of my most popular tweets.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that? Is that correct? Will you be? Will you have to change your Twitter behavior?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Not really. I think it’s mostly just if it’s something that might cause a substantial movement in the stock during trading hours. That’s about it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Do you consider it a communications medium? How do you look at it?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening. It feels like dipping into the flow of consciousness of society. That’s what it feels like. It’s kinda weird. I guess I sometimes use Twitter to express myself, and that’s a weird thing to do, I suppose.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Some people use their hair to express themselves. I use Twitter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "You pick fights with the press over Twitter, and then you have all your fans, of which there are many. Are you aware of what they do once you start them off?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Explain that, please.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "The amount of untruthful stuff that is written is unbelievable. Take that Wall Street Journal front-page article about, like, “The FBI is closing in.” That is utterly false. That’s absurd. To print such a falsehood on the front page of a major newspaper is outrageous. Like, why are they even journalists? They’re terrible. Terrible people.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I get that, but do you understand the mood in this country around the press and the dangers of attacking, especially when the president is doing that? In quite an aggressive, “enemy of the state” and everything else. It’s disturbing when someone like you as a leader does that, too, or goes along with it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "The answer is for the press to be honest and truthful, and research their articles and correct things properly when they are false. Which they don’t do.", dateOfCreation: Date(), isIncomming: false)
                   ],
                   online: false,
                   hasUnreadMessages: false,
                   profileImage: nil),
        
     PersonChat(name: "Nikita Kolesov",
                messages: [
                    Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    Message(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -30000), isIncomming: false)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Morris Henrey",
                messages: [
                    Message(messagetext: "Hello, Ivan! Did you make that deal, that I asked?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "No, sorry, I did not", dateOfCreation: Date(timeIntervalSinceNow: -40000), isIncomming: false)],
                online: false,
                hasUnreadMessages: true,
                profileImage: nil),
        
     PersonChat(name: "Irma Flores",
                messages: [
                    Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    Message(messagetext: "How are you, darling?", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
        
     PersonChat(name: "Collin Williams",
                messages: [
                    Message(messagetext: "What do you think of that? Are you worried about unleashing a dangerous cycle that a lot of the press are worried about? Justifiably.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    Message(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
        PersonChat(name: "Oliver Flinn",
                   messages: [
                    Message(messagetext: "What’s Twitter?", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What’s Twitter? Okay, let’s start with Twitter. I have an obsession with Twitter, too, and an addiction. What happens with you and Twitter?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I tweet interesting things pretty much as they come to me, and probably with not much of a filter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "And why?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I find it entertaining. I think, “Oh, other people might find this entertaining.” Sometimes they do.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Just at night? What are you, at home you’re doing this?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. Mostly at home. I spend a lot less time on Twitter than people probably think. It’s like maybe 10-15 minutes or something.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Yeah, well people pay attention when you do that.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Yeah. It’s pretty interesting what my most ... What people are most interested in, like some little tweet about “I love anime.” That was it. But it was lowercase “i”, black heart, “anime,” and people loved that. That was like one of my most popular tweets.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "What about the things they didn’t love? Are you under strict orders not to do that? Is that correct? Will you be? Will you have to change your Twitter behavior?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Not really. I think it’s mostly just if it’s something that might cause a substantial movement in the stock during trading hours. That’s about it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Do you consider it a communications medium? How do you look at it?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "How are you!", dateOfCreation: Date(), isIncomming: true), Message(messagetext: "I look at it as a way to learn things, kinda stay in touch with what’s happening. It feels like dipping into the flow of consciousness of society. That’s what it feels like. It’s kinda weird. I guess I sometimes use Twitter to express myself, and that’s a weird thing to do, I suppose.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Not so much. It isn’t. Sometimes it’s very funny, other times it’s not so funny.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Some people use their hair to express themselves. I use Twitter.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "You pick fights with the press over Twitter, and then you have all your fans, of which there are many. Are you aware of what they do once you start them off?", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "Well, I have to say, my regard for the press has dropped quite dramatically.i", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "Explain that, please.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "The amount of untruthful stuff that is written is unbelievable. Take that Wall Street Journal front-page article about, like, “The FBI is closing in.” That is utterly false. That’s absurd. To print such a falsehood on the front page of a major newspaper is outrageous. Like, why are they even journalists? They’re terrible. Terrible people.", dateOfCreation: Date(), isIncomming: true),
                    Message(messagetext: "I get that, but do you understand the mood in this country around the press and the dangers of attacking, especially when the president is doing that? In quite an aggressive, “enemy of the state” and everything else. It’s disturbing when someone like you as a leader does that, too, or goes along with it.", dateOfCreation: Date(), isIncomming: false),
                    Message(messagetext: "The answer is for the press to be honest and truthful, and research their articles and correct things properly when they are false. Which they don’t do.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: false)
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
                    Message(messagetext: "Good day", dateOfCreation: Date(timeIntervalSinceNow: -3000), isIncomming: true),
                    Message(messagetext: "How are you, man?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: false),
                Message(messagetext: "I am fine and you?", dateOfCreation: Date(timeIntervalSinceNow: -500000), isIncomming: true)],
                online: false,
                hasUnreadMessages: false,
                profileImage: nil),
     PersonChat(name: "King Artur",
                messages: [
                    Message(messagetext: "What do you think of that? Are you worried about unleashing a dangerous cycle that a lot of the press are worried about? Justifiably.", dateOfCreation: Date(timeIntervalSinceNow: -300000), isIncomming: true),
                    Message(messagetext: "I suggest the press take it to heart and do better.", dateOfCreation: Date(timeIntervalSinceNow: -10000000), isIncomming: false)],
                online: false,
                hasUnreadMessages: true,
                profileImage: nil),
        ]
    }
}

struct Message {
    var messagetext: String
    var dateOfCreation: Date
    var isIncomming: Bool
}

