//
//  ConversationsListTableViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import UIKit

class ConversationsListViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var users = PersonChat.getPersonChat()
    private let sectionNames = ["Online", "History"]
    
    private var filterdUsers: [PersonChat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Prepare Data Source
    
    private var onlineUsers: [PersonChat] {
        users.filter {$0.online }
    }
    
    private var oflineUsers: [PersonChat] {
        users.filter {!$0.online }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionNames[section]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionNames.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return onlineUsers.count
        } else {
            return oflineUsers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListCell", for: indexPath) as? ConversationsListCell
        var user: PersonChat?
        indexPath.section == 0 ? (user = onlineUsers[indexPath.row]) : ( user = oflineUsers[indexPath.row])
        //        user = users[indexPath.row]
        
        guard let notNilUser = user else { return UITableViewCell() }
        cell?.clearCell()
        cell?.configureCell(chat: notNilUser)
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedIndexPath = tableView.indexPathForSelectedRow
        guard let conversationVC = segue.destination as? ConversationViewController else { return }
        var user: PersonChat?
        
        if selectedIndexPath?.section == 0 {
            user = onlineUsers[selectedIndexPath?.row ?? 0]
        } else {
            user = oflineUsers[selectedIndexPath?.row ?? 0]
        }
        conversationVC.user = user
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        
        users = searchText.isEmpty ? users : users.filter {
            return $0.name.range(of: searchText, options: .caseInsensitive) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        users = PersonChat.getPersonChat()
        tableView.reloadData()
    }
    
}
