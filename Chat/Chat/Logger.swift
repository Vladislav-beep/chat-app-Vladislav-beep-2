//
//  Logger.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

final class Logger {
    
    static let shared = Logger()
    private init() {}

   private var previousState = "inactive"
    private var currentState: String {
        let appState = UIApplication.shared.applicationState
        switch appState {
        
        case .active:
            return "active state"
        case .inactive:
            return "inactive state"
        case .background:
            return "background state"
        @unknown default:
            return ""
        }
    }
    
    func logPrint(method: String) {
        #if DEBUG
        print("Application moved from: \(previousState) to \(currentState), method name: \(method)")
        previousState = currentState
        #endif
        
    }
}
