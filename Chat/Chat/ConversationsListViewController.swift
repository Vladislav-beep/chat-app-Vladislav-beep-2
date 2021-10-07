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
    
    private lazy var navigationImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "my profile"), for: .normal)
        button.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationImage.layer.cornerRadius = navigationImage.layer.frame.width / 2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showImage(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
    }
    
    
    @objc private func imageTapped() {
        performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
    // MARK: - Prepare Data Source
    
    private var onlineUsers: [PersonChat] {
        users.filter {$0.online }
    }
    
    private var offlineUsers: [PersonChat] {
        users.filter {!$0.online }
    }
    
    private func setupNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(navigationImage)
        navigationImage.clipsToBounds = true
        navigationImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationImage.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -16),
            navigationImage.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 4),
            navigationImage.heightAnchor.constraint(equalToConstant: 36),
            navigationImage.widthAnchor.constraint(equalTo: navigationImage.heightAnchor)
        ])
    }
    
    private func showImage(_ show: Bool) {
        navigationImage.alpha = show ? 1.0 : 0.0
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
            return offlineUsers.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListCell", for: indexPath) as? ConversationsListCell
        
        var user: PersonChat?
        indexPath.section == 0 ? (user = onlineUsers[indexPath.row]) : ( user = offlineUsers[indexPath.row])
        
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
            user = offlineUsers[selectedIndexPath?.row ?? 0]
        }
        conversationVC.setUser(personChat: user)
    }
    
    // MARK: - Search Bar
    
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
