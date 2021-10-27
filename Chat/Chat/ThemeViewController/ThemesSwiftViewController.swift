//
//  ThemesSwiftViewController.swift
//  Chat
//
//  Created by Владислав Сизонов on 12.10.2021.
//

import UIKit

class ThemesSwiftViewController: UIViewController {
    
    @IBOutlet var themeOneButton: UIButton!
    @IBOutlet var themeTwoButton: UIButton!
    @IBOutlet var themeThreeButton: UIButton!
    
    var callBack: ((UIColor) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeOneButton.layer.cornerRadius = 8
        themeTwoButton.layer.cornerRadius = 8
        themeThreeButton.layer.cornerRadius = 8
        
    }
    
    @IBAction func themeOneButtonPressed(_ sender: UIButton) {
        callBack?(UIColor.white)
        if let selectedTheme = Theme(rawValue: 0) {
            selectedTheme.apply()
        }
    }
    
    @IBAction func themeTwoButtonPressed(_ sender: UIButton) {
        callBack?(UIColor.black)
        if let selectedTheme = Theme(rawValue: 1) {
            selectedTheme.apply()
        }
    }
    
    @IBAction func themeThreeButtonPressed(_ sender: UIButton) {
        callBack?(UIColor.yellow)
        if let selectedTheme = Theme(rawValue: 2) {
            selectedTheme.apply()
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
