//
//  ConversationsListCell.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.


import UIKit

protocol ConversationCellConfigurationProtocol: AnyObject {
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool {get set}
    var hasUnreadMessages: Bool {get set}
}

class ConversationsListCell: UITableViewCell, ConversationCellConfigurationProtocol {

    @IBOutlet weak var isOnlineIndicator: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var name: String?
    var message: String?
    var date: Date?
    var online: Bool = false
    var hasUnreadMessages: Bool = false

    //    init() {
    //        super.init(style: .default, reuseIdentifier: "conversationsListCell")
    //
    //    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        isOnlineIndicator.layer.cornerRadius = isOnlineIndicator.frame.width / 2
        isOnlineIndicator.layer.borderWidth = 2
        isOnlineIndicator.layer.borderColor = UIColor.white.cgColor
    }

    private func checkCurrentBackground() {
        if online {
            isOnlineIndicator.isHidden = false
        }
    }

    private func chechUnreadMesage() {
        if hasUnreadMessages {
            messageLabel.font = .boldSystemFont(ofSize: 17)
        }
    }

    func configureCell(chat: PersonChat?) {
        name = chat?.name
        online = chat?.online ?? false
        hasUnreadMessages = chat?.hasUnreadMessages ?? false
        
        checkCurrentBackground()
        
        if let lastMessage = chat?.messages.last {
        message = lastMessage?.messagetext
        date = lastMessage?.dateOfCreation
        }
        
        setValues()
        chechUnreadMesage()
        checkMessage()
        
    }

    func setValues() {
        nameLable.text = name
        messageLabel.text = message
        dateLabel.text = getdate()
        profileImage.image = UIImage(named: "profile image")
    }

    func clearCell() {
        isOnlineIndicator.isHidden = true
        profileImage.image = nil
        nameLable.text = nil
        messageLabel.text = nil
        dateLabel.text = nil
    }
    
    

    func checkMessage() {
        
        if message == nil {
        messageLabel.text = "No messages yet"
        messageLabel.font = UIFont(name: "Didot", size: 17)
        } else {
            messageLabel.text = message
        }
    }

    //    required init?(coder: NSCoder) {
    //        super.init(coder: coder)
    //    }

    func getdate() -> String {
        
        var stringDate = ""
            let dateFormatter = DateFormatter()
            if Calendar.current.isDateInToday(date ?? Date()) {
                dateFormatter.dateFormat = "HH:mm"
                let time = dateFormatter.string(from: date ?? Date())
                stringDate = time
            } else {
                dateFormatter.dateFormat = "dd/MM/yyyy"
                let time = dateFormatter.string(from: date ?? Date())
                stringDate = time
        }
        return stringDate
    }

}
