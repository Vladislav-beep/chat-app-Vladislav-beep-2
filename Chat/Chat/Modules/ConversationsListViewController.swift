//
//  ConversationsListTableViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import UIKit
import Firebase

class ConversationsListViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var addChannelButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Private Properties
    
    private var users = PersonChat.getPersonChat()
    
    private lazy var db = Firestore.firestore()
    
    private lazy var referenceChannel = db.collection("channels")
    private lazy var referenceMessage: CollectionReference = {
        guard let channelIdentifier = channel?.identifier else { fatalError() }
        return db.collection("channels").document(channelIdentifier).collection("messages")
    }()
    
    private lazy var navigationImage: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "my profile"), for: .normal)
        button.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Public Properties
    
    var channel: Channel?
    var channelArray = [Channel]()
    var channels = [Channel]()
    
    // MARK: - ViewController Lifecycle
    
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
        channels = channelArray
        showImage(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showSwiftTheme", sender: nil)
    }
    
    @IBAction func themeButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showObjcTheme", sender: self)
    }
    
    @IBAction func addChannelButtonPressed(_ sender: UIBarButtonItem) {
        showAlert(message: "", title: "Add channel")
    }
    
    // MARK: - Private methods
    
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
    
    private func getChannels() {
        
        referenceChannel.addSnapshotListener { [weak self] (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
                    return
                }
            
            if let snapshot = snapshot {
                self?.channelArray.removeAll()
                for document in snapshot.documents {
                   
                    let data = document.data()
                    let time = (data["lastActivity"] as? Timestamp)?.dateValue()
                    self?.channel = Channel(identifier: document.documentID,
                                             name: data["name"] as? String ?? "",
                                             lastMessage: data["lastMessage"] as? String ?? "",
                                             lastActivity: time)
                    self?.channelArray.append(self?.channel ?? Channel(identifier: "", name: "", lastMessage: "", lastActivity: Date()))
                 
                }
                self?.channels = self?.channelArray ?? [Channel(identifier: "", name: "", lastMessage: "", lastActivity: Date())]
                self?.channelArray.sort { $0.lastActivity ?? Date() > $1.lastActivity ?? Date() }
                
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
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        channelArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conversationsListCell", for: indexPath) as? ConversationsListCell
        channel = channelArray[indexPath.row]
        cell?.configureCell(channel: channel)
        
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
            guard let conversationVC = segue.destination as? ConversViewController else { return }
            channel = channelArray[selectedIndexPath?.row ?? 0]
            conversationVC.channel = channel
        }
    }
    
    // MARK: - Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true

        channelArray = searchText.isEmpty ? channelArray : channelArray.filter {
            return $0.name.range(of: searchText, options: .caseInsensitive) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        channelArray = channels
        tableView.reloadData()
    }
}

extension ConversationsListViewController: ThemesViewControllerDelegateProtocol {
    
    func themesViewController(_ controller: ThemesViewController, didSelectTheme selectedTheme: UIColor) {
        logThemeChanging(selectedTheme: selectedTheme)
    }
}
