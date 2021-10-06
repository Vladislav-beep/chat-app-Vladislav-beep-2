//
//  ConversationViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 04.10.2021.
//

import UIKit

class ConversationViewController: UITableViewController {
    
    // MARK: UI
    
    private lazy var navImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "profile image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var navLabel: UILabel = {
        let label = UILabel()
        label.text = user?.name
        label.textAlignment = .left
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navImageView.layer.cornerRadius = navImageView.layer.frame.width / 2
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
            navLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -4),
        ])
        navigationItem.titleView = navigationView
    }
    
    func setUser(personChat: PersonChat?) {
        user = personChat
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user?.messages.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? ChatMessageCell
        
        cell?.setChatMessage(message: user?.messages[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
