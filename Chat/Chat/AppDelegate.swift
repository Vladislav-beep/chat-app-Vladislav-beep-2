//
//  AppDelegate.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private let logger = Logger.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        logger.logPrint(method: #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        logger.logPrint(method: #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        logger.logPrint(method: #function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        logger.logPrint(method: #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        logger.logPrint(method: #function)
    }
}

