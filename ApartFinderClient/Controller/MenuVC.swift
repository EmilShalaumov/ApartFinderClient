//
//  MenuVC.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 13/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutBtnPressed(_ sender: Any) {
        UIApplication.setRootView(AppStoryboard.instantiate(.Login))
    }
    
}
