//
//  ConversationViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import UIKit
import Firebase

class ConversationViewController: UITableViewController {
    
   // var referenceMessage: CollectionReference?
    
    private lazy var db = Firestore.firestore()
    private lazy var referenceMessage: CollectionReference = {
    guard let channelIdentifier = channel?.identifier else { fatalError() }
    return db.collection("channels").document(channelIdentifier).collection("messages")
    }()
    
    var messages = [Message]()
    var message: Message?
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
    
   private var user: PersonChat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
//        let newMessage = Message(content: "!!!!!?",
//                                 created: Date(),
//                                 senderId: UIDevice.current.identifierForVendor!.uuidString,
//                                 senderName: "Egor")
//        referenceMessage.addDocument(data: newMessage.toDict)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMessages()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navImageView.layer.cornerRadius = navImageView.layer.frame.width / 2
    }
    
    private func getMessages() {
        messages = []
        referenceMessage.addSnapshotListener { [weak self] snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let documents = snapshot?.documents {
                for document in documents {
                    let data = document.data()
                    let time = (data["created"] as? Timestamp)?.dateValue()
                    self?.message = Message(content: data["content"] as? String ?? "",
                                            created: time ?? Date(),
                                            senderId: data["senderId"] as? String ?? "",
                                            senderName: data["senderName"] as? String ?? "")
                    self?.messages.append(self?.message ?? Message(content: "",
                                                                   created: Date(),
                                                                   senderId: "",
                                                                   senderName: ""))
                }
                self?.tableView.reloadData()
            }
        }
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
    
    func setUser(personChat: PersonChat?) {
        user = personChat
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
        // user?.messages.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? ChatMessageCell
        
       // cell?.messageLabel.text = messages[indexPath.row].content
        
        cell?.setChatMessage(message: messages[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
