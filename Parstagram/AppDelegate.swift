//
//  AppDelegate.swift
//  Parstagram
//
//  Created by Ali Ma on 3/5/21.
//

import UIKit
import Parse
//import Window

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // ––––– Lab 5 TODO: Initialize Parse
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // --- Copy this only
        
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "1UwGmlP44lzk92JRCq4AGnyBbawCs03oOcwj37De" // <- UPDATE
                $0.clientKey = "N93wTUojjVkeehd3tBclAWyB6ZJqGAlzWE7houYk" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        // --- end copy
        return true
      }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    



}

