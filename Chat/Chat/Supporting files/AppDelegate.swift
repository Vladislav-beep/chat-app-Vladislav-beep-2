//
//  AppDelegate.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let logger = Logger.shared
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Theme.current.apply()
        FirebaseApp.configure()

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        logger.logPrint(methodName: #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        logger.logPrint(methodName: #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        logger.logPrint(methodName: #function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        logger.logPrint(methodName: #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        logger.logPrint(methodName: #function)
    }
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
