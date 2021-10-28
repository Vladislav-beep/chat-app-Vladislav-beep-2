//
//  ConversViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 28.10.2021.
//

import UIKit
import Firebase

class ConversViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Dependencies
    
    let profileDataManagerGCD = ProfileDataManager()
    
    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextField: UITextField!
    
    // MARK: - Private Properties
    
    private lazy var db = Firestore.firestore()
    
    private lazy var referenceMessage: CollectionReference = {
        guard let channelIdentifier = channel?.identifier else { fatalError() }
        return db.collection("channels").document(channelIdentifier).collection("messages")
    }()
    
    private var messages = [Message]()
    private var message: Message?
    private var author = ""
    
    // MARK: - Public Properties
    
    var channel: Channel?
    
    // MARK: UI
    
    private lazy var navImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var navLabel: UILabel = {
        let label = UILabel()
        label.text = channel?.name
        label.textAlignment = .left
        label.textColor = Theme.current.navLabelColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.frame = (navigationController?.navigationBar.frame) ?? CGRect()
        return view
    }()
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessageTextField()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMessages()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navImageView.layer.cornerRadius = navImageView.layer.frame.width / 2
    }
    
    // MARK: - Private methods
    
    private func getMessages() {
        referenceMessage.addSnapshotListener { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let documents = snapshot?.documents {
                self.messages.removeAll()
                for document in documents {
                    let data = document.data()
                    let time = (data["created"] as? Timestamp)?.dateValue()
                    self.message = Message(content: data["content"] as? String ?? "",
                                           created: time ?? Date(),
                                           senderId: data["senderID"] as? String ?? "",
                                           senderName: data["senderName"] as? String ?? "")
                    self.messages.append(self.message ?? Message(content: "",
                                                                 created: Date(),
                                                                 senderId: "",
                                                                 senderName: ""))
                }
                self.messages.sort { $0.created < $1.created }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                guard self.messages.count - 1 >= 0 else { return }
                let lastRow = self.messages.count - 1
                DispatchQueue.main.async {
                    self.tableView.scrollToRow(at: IndexPath(row: lastRow, section: 0), at: .bottom, animated: true)
                }
                
            }
        }
    }
    
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
    
    private func setupMessageTextField() {
        messageTextField.delegate = self
        messageTextField.layer.borderWidth = 1
        messageTextField.layer.cornerRadius = 4
    }
    
    private func setupNavigationBar() {
        navigationView.addSubview(navImageView)
        navigationView.addSubview(navLabel)
        
        NSLayoutConstraint.activate([
            navImageView.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 4),
            navImageView.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 4),
            navImageView.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -4),
            navImageView.widthAnchor.constraint(equalTo: navImageView.heightAnchor),
            
            navLabel.leadingAnchor.constraint(equalTo: navImageView.trailingAnchor, constant: 4),
            navLabel.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -4),
            navLabel.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 4),
            navLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -4)
        ])
        navigationItem.titleView = navigationView
    }
    
    // MARK: - IB Actions
    
    @IBAction func sendMessageButtonTapped(_ sender: UIButton) {
        guard messageTextField.text != ""
        else { return }
        let newMessage = Message(content: messageTextField.text ?? "",
                                 created: Date(),
                                 senderId: UIDevice.current.identifierForVendor!.uuidString,
                                 senderName: author)
        referenceMessage.addDocument(data: newMessage.toDict)
        messageTextField.text = ""
    }
    
    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? ChatMessageCell
        cell?.setChatMessage(message: messages[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ConversViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
