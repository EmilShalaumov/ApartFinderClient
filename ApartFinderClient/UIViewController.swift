//
//  UIViewController.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 07/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    class var storyboardID: String {
        return "\(self)"
    }
    
    static func instantiate(from: AppStoryboard) -> Self {
        return from.viewController(viewControllerClass: self)
    }
}
