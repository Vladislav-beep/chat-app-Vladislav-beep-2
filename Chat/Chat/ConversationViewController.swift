//
//  ConversationViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import UIKit

class ConversationViewController: UITableViewController {
    
    var user: PersonChat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.name
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell
        
        cell?.clear()
        cell?.configureCell(message: user.messages[indexPath.row] ?? Message(messagetext: "", dateOfCreation: Date(), isIncomming: false))
        updateViewConstraints()
        
        return cell ?? UITableViewCell()
    }
}
