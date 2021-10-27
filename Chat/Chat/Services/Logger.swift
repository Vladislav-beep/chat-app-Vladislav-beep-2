//
//  Logger.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

protocol LoggerProtocol {
    func logPrint(methodName: String)
}

final class Logger: LoggerProtocol {

    static let shared = Logger()
    private init() {}

    private var previousState = "Inactive state"

    private var currentState: String {
        let applicationState = UIApplication.shared.applicationState

        switch applicationState {
        case .active:
            return "Active state"
        case .inactive:
            return "Inactive state"
        case .background:
            return "Background state"
        @unknown default:
            return ""
        }
    }

    /// Для отключения логов необходимо изменить BuildConfiguration на Release
    func logPrint(methodName: String) {
        #if DEBUG
        print("Application moved from \(previousState) to \(currentState), method name: \(methodName)")
        previousState = currentState
        #endif
    }
}
