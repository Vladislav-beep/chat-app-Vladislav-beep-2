//
//  ViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let logger = Logger.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.logPrint(methodName: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logger.logPrint(methodName: #function)
    }
    
    override func viewWillLayoutSubviews() {
        logger.logPrint(methodName: #function)
    }
    
    override func viewDidLayoutSubviews() {
        logger.logPrint(methodName: #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logger.logPrint(methodName: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logger.logPrint(methodName: #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logger.logPrint(methodName: #function)
    }
}


