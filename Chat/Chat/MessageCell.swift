//
//  MessageCell.swift
//  Chat
//
//  Created by Владислав Сизонов on 05.10.2021.
//

import UIKit

protocol MessageCellConfigurationProtocol: AnyObject {
    var textOfLabel: String? {get set}
}

final class MessageCell: UITableViewCell, MessageCellConfigurationProtocol {
    
    var textOfLabel: String?
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint?
    @IBOutlet weak var trailingConstarint: NSLayoutConstraint?
    
    func configureCell(message: Message) {
        messageLabel.text = message.messagetext
        
        if message.isIncomming {
            leadingConstraint?.isActive = true
            trailingConstarint?.isActive = false
        } else {
            leadingConstraint?.isActive = false
            trailingConstarint?.isActive = true
        }
        changeBackground(isIncomming: message.isIncomming) 
    }
    
    func clear() {
        messageLabel.text = nil
        bubbleView.backgroundColor = .clear
    }
    
    
    func changeBackground(isIncomming: Bool) {
        bubbleView.layer.backgroundColor = isIncomming
            ? UIColor(red: 0.875, green: 0.875, blue: 0.875, alpha: 1).cgColor
            : UIColor(red: 0.863, green: 0.969, blue: 0.773, alpha: 1).cgColor
    }
    
    override func layoutSubviews() {
        bubbleView.layer.cornerRadius = 15
    }
}
