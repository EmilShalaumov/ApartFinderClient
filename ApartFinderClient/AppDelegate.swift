//
//  AppDelegate.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 06/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public static let DATA_SERVICE_URL = "http://192.168.0.102:8080"
    
    public static var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "token")
        } set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        
        if AppDelegate.token == nil {
                //UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
            self.window?.rootViewController = AppStoryboard.instantiate(.Login)
        } else {
                //UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()!
            self.window?.rootViewController = AppStoryboard.instantiate(.Main)
        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

