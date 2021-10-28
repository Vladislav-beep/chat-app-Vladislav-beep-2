//
//  MessageCell.swift
//  Chat
//
//  Created by Владислав Сизонов on 05.10.2021.
//

import UIKit
import Firebase

protocol MessageCellConfigurationProtocol: AnyObject {
    var chatMessage: Message? {get set}
}

final class ChatMessageCell: UITableViewCell {
    
    // MARK: - Dependencies
    
   private let profileDataManagerGCD = ProfileDataManager()
    
    // MARK: - Private Properties
    
    private var author: String = ""
    
    // MARK: - UI
    
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bubbleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
        setupConstraints()
    }
    
    // MARK: - Private Properties
    
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    
    private var chatMessage: Message? {
        didSet {
            getAuthoeNameFromFile()
            messageLabel.text = chatMessage?.content
            
            dateLabel.text = getdate()
            dateLabel.font = .boldSystemFont(ofSize: 10)
            dateLabel.textAlignment = .right
            dateLabel.textColor = #colorLiteral(red: 0.5999478698, green: 0.6000345945, blue: 0.5999205709, alpha: 1)
            
            authorLabel.text = chatMessage?.senderName
            authorLabel.font = .boldSystemFont(ofSize: 12)
            
            changeBackground()
           // setupConstraints()
            layoutConstraints()
        }
    }
    
    // MARK: - Private methods
    
    private func getAuthoeNameFromFile() {
        profileDataManagerGCD.getValue(completion: { [weak self] (result: Result<Profile, FileManagerError>) in
            guard let self = self else { return }
            switch result {
            case .success(let profile):
                self.author = profile.fullName ?? ""
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func changeBackground() {
        bubbleView.backgroundColor = chatMessage?.senderId != UIDevice.current.identifierForVendor?.uuidString
            ? UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
            : UIColor(red: 0.863, green: 0.969, blue: 0.773, alpha: 1)
        
        if chatMessage?.content == nil {
            bubbleView.alpha = 0
        }
    }
    
    private func layoutConstraints() {
        if chatMessage?.senderId != UIDevice.current.identifierForVendor!.uuidString {
            leadingConstraint?.isActive = true
            trailingConstraint?.isActive = false
        } else {
            leadingConstraint?.isActive = false
            trailingConstraint?.isActive = true
        }
    }
    
    //    private func setupConstraints() {
    //        addSubview(bubbleView)
    //        addSubview(messageLabel)
    //        NSLayoutConstraint.activate([
    //            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
    //            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
    //            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width * 3 / 4),
    //
    //            bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
    //            bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
    //            bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
    //            bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8)
    //        ])
    //        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    //        leadingConstraint?.isActive = false
    //        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    //        trailingConstraint?.isActive = true
    //    }
    
    private func setupConstraints() {
        addSubview(bubbleView)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width * 3 / 4),
            
            bubbleView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -8),
            bubbleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -8),
            bubbleView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            bubbleView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8)
        ])
        leadingConstraint = stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        leadingConstraint?.isActive = false
        trailingConstraint = stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        trailingConstraint?.isActive = true
        
        if  chatMessage?.senderName != author {
            stackView.addArrangedSubview(authorLabel)
        }
        
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(dateLabel)
        stackView.spacing = 6
    }
    
    private func getdate() -> String {
        
        var stringDate = ""
        let dateFormatter = DateFormatter()
        if Calendar.current.isDateInToday(chatMessage?.created ?? Date()) {
            dateFormatter.dateFormat = "HH:mm"
            let time = dateFormatter.string(from: chatMessage?.created ?? Date())
            stringDate = time
        } else {
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let time = dateFormatter.string(from: chatMessage?.created ?? Date())
            stringDate = time
        }
        return stringDate
    }
    
    // MARK: - Public methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leadingConstraint?.isActive = false
        trailingConstraint?.isActive = false
        messageLabel.text = ""
        authorLabel.text = ""
        dateLabel.text = ""
    }
    
    func setChatMessage(message: Message?) {
        chatMessage = message
    }
}
