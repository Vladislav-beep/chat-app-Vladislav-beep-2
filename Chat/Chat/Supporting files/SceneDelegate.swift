//
//  SceneDelegate.swift
//  Chat
//
//  Created by Владислав Сизонов on 21.09.2021.
//

import UIKit
import CoreData

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    let logger = Logger.shared
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      //  guard let _ = (scene as? UIWindowScene) else { return }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        logger.logPrint(methodName: #function)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        logger.logPrint(methodName: #function)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        logger.logPrint(methodName: #function)
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        logger.logPrint(methodName: #function)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        logger.logPrint(methodName: #function)
    }
}
