//
//  AppStoryboard.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 13/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    case Main = "Main"
    case Login = "Login"
    
    static func instantiate(_ vcIdentifier: AppStoryboard) -> UIViewController {
        if vcIdentifier == .Login {
            AppDelegate.token = nil
        }
        return UIStoryboard(name: vcIdentifier.rawValue, bundle: nil).instantiateInitialViewController()!
    }
}
