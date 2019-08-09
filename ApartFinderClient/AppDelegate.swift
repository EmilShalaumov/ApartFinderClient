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
    public static let DATA_SERVICE_URL = "http://localhost:8080"
    
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
        
        AppDelegate.token = nil
        
        if AppDelegate.token != nil {
            let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
            self.window?.rootViewController = mainViewController
            AppDelegate.token = nil
        } else {
            let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()!
            self.window?.rootViewController = loginViewController
            AppDelegate.token = "aaa"
        }
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

