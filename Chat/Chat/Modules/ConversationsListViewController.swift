//
//  ConversationsListTableViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import UIKit
import Firebase

class ConversationsListViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet var addChannelButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var users = PersonChat.getPersonChat()
    private let sectionNames = ["Online", "History"]
    
    private var filterdUsers: [PersonChat]?
    
    private lazy var db = Firestore.firestore()
    
    private lazy var referenceChannel = db.collection("channels")
    private lazy var referenceMessage: CollectionReference = {
        guard let channelIdentifier = channel?.identifier else { fatalError() }
        return db.collection("channels").document(channelIdentifier).collection("messages")
    }()
    
    var channel: Channel?
    var channelArray = [Channel]()
    
    private lazy var navigationImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "my profile"), for: .normal)
        button.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
           print(deviceID)
        getChannels()
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
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showSwiftTheme", sender: nil)
    }
    
    @objc private func imageTapped() {
        performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
    func logThemeChanging(selectedTheme: UIColor) {
        print("Выбранная тема: \(getColorName(color: selectedTheme))")
    }
    
    private func getColorName(color: UIColor) -> String {
        switch color {
        case .red:
            return "Красная"
        case .green:
            return "Зеленая"
        case .white:
            return "Светлая"
        case .black:
            return "Темная"
        case .yellow:
            return "Шампань"
        default : return ""
        }
    }
    
    @IBAction func themeButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showObjcTheme", sender: self)
    }
    // MARK: - Prepare Data Source
    
//    private var onlineUsers: [PersonChat] {
//        users.filter {$0.online }
//    }
//
//    private var offlineUsers: [PersonChat] {
//        users.filter {!$0.online }
//    }
    
    private func getChannels() {
        channelArray = []
        referenceChannel.addSnapshotListener { [weak self] (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                    return
                }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let time = (data["lastActivity"] as? Timestamp)?.dateValue()
                    self?.channel = Channel(identifier: document.documentID,
                                             name: data["name"] as? String ?? "",
                                             lastMessage: data["lastMessage"] as? String ?? "",
                                             lastActivity: time)
                    self?.channelArray.append(self?.channel ?? Channel(identifier: "", name: "", lastMessage: "", lastActivity: Date()))
                    
                 //   print(self?.channel)
                }
                self?.tableView.reloadData()
            }
        }
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
    
    private func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Entel channel name"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alert.textFields?.first, textField.text != "" else { return }
            self.referenceChannel.addDocument(data: ["name": "\(textField.text ?? "")"])
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    private func showImage(_ show: Bool) {
        navigationImage.alpha = show ? 1.0 : 0.0
    }
    
    @IBAction func addChannelButtonPressed(_ sender: UIBarButtonItem) {
        showAlert(message: "", title: "Add channel")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        sectionNames[section]
//    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        sectionNames.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        channelArray.count
        //        if section == 0 {
//            return onlineUsers.count
//        } else {
//            return offlineUsers.count
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListCell", for: indexPath) as? ConversationsListCell
        
        channel = channelArray[indexPath.row]
        
        cell?.configureCell(channel: channel)
        
//        cell?.nameLable.text = channel?.name
//        cell?.messageLabel.text = channel?.lastMessage
//        cell?.date = channel?.lastActivity
        
       // cell?.dateLabel.text = getdate(date: (channel?.lastActivity)!)
//        var user: PersonChat?
//        indexPath.section == 0 ? (user = onlineUsers[indexPath.row]) : ( user = offlineUsers[indexPath.row])
//
//        guard let notNilUser = user else { return UITableViewCell() }
//        cell?.configureCell(chat: notNilUser)
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showObjcTheme" {
            guard let destination = segue.destination as? ThemesViewController else { return }
            destination.delegate = self
        } else if segue.identifier == "showSwiftTheme" {
            guard let destination = segue.destination as? ThemesSwiftViewController else { return }
            destination.callBack = { [weak self] color in
                self?.logThemeChanging(selectedTheme: color)
            }
        
        } else {
            let selectedIndexPath = tableView.indexPathForSelectedRow
            guard let conversationVC = segue.destination as? ConversationViewController else { return }
            channel = channelArray[selectedIndexPath?.row ?? 0]
            conversationVC.channel = channel
          //  conversationVC.referenceMessage = referenceMessage
            
//            var user: PersonChat?
//
//            if selectedIndexPath?.section == 0 {
//                user = onlineUsers[selectedIndexPath?.row ?? 0]
//            } else {
//                user = offlineUsers[selectedIndexPath?.row ?? 0]
//            }
//            conversationVC.setUser(personChat: user)
        }
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

extension ConversationsListViewController: ThemesViewControllerDelegateProtocol {
    
    func themesViewController(_ controller: ThemesViewController, didSelectTheme selectedTheme: UIColor) {
        logThemeChanging(selectedTheme: selectedTheme)
    }
}
