//
//  ViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {

    let logger = Logger.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logger.logPrint(method: #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        logger.logPrint(method: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        logger.logPrint(method: #function)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        logger.logPrint(method: #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logger.logPrint(method: #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logger.logPrint(method: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        logger.logPrint(method: #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        logger.logPrint(method: #function)
    }
}

