//
//  AppStoryboard.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 07/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard: String {
    
    case Login = "Login"
    case Main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
}
