//
//  MessageCell.swift
//  Chat
//
//  Created by Владислав Сизонов on 05.10.2021.
//

import UIKit

protocol MessageCellConfigurationProtocol: AnyObject {
    var chatMessage: Message? {get set}
}

final class ChatMessageCell: UITableViewCell, MessageCellConfigurationProtocol {
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bubbleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
            
        return view
    }()
    
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
        setupConstraints()
    }
    
     var chatMessage: Message? {
        didSet {
            changeBackground()
            messageLabel.text = chatMessage?.messagetext
            layoutConstraints()
        }
    }
    
    private func changeBackground() {
        bubbleView.backgroundColor = chatMessage?.isIncomming ?? true
            ? UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1)
            : UIColor(red: 0.863, green: 0.969, blue: 0.773, alpha: 1)
        
        if chatMessage?.messagetext == nil {
            bubbleView.alpha = 0
        }
    }
    
    private func layoutConstraints() {
        if chatMessage?.isIncomming ?? true {
            leadingConstraint?.isActive = true
            trailingConstraint?.isActive = false
        } else {
            leadingConstraint?.isActive = false
            trailingConstraint?.isActive = true
        }
    }
    
    private func setupConstraints() {
        addSubview(bubbleView)
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width * 3 / 4),
            
            bubbleView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
        ])
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        leadingConstraint?.isActive = false
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint?.isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leadingConstraint?.isActive = false
        trailingConstraint?.isActive = false
    }
    
    func setChatMessage(message: Message?) {
        chatMessage = message
    }
}
