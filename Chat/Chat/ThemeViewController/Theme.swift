//
//  Theme.swift
//  Chat
//
//  Created by Владислав Сизонов on 12.10.2021.
//

import UIKit

enum Theme: Int {
    
    case `default`, dark, graphical
    
    private enum Keys {
        static let selectedTheme = "SelectedTheme"
    }
    
    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .default
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .default, .graphical:
            return .default
        case .dark:
            return .black
        }
    }
    
    var barTintColor: UIColor {
        switch self {
        case .default:
            return .blue
        case .graphical:
            return UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        case .dark:
            return .white
        }
    }
    
    var navLabelColor: UIColor {
        switch self {
        case .default:
            return .black
        case .graphical:
            return UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 43.0/255.0, alpha: 1.0)
        case .dark:
            return .white
        }
    }
    
    func apply() {
        UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
        UserDefaults.standard.synchronize()
        
        UINavigationBar.appearance().barStyle = barStyle
        UINavigationBar.appearance().tintColor = barTintColor
    }
}



