//
//  LoginViewController.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 07/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInBtnPressed(_ sender: UIButton) {
        let LOG_IN_URL = AppDelegate.DATA_SERVICE_URL + "/auth/login"
        
        let parameters = ["username": usernameTextField.text!,
                          "password": passwordTextField.text!]

        AF.request(LOG_IN_URL, method: .get, parameters: parameters).responseJSON { response in
            print(response)
            
            if let result = response.value {
                let jsonData = result as! NSDictionary
                print(jsonData.value(forKey: "responseString") as! String)
                if (jsonData.value(forKey: "responseString") as! String) == "success" {
                    AppDelegate.token = (jsonData.value(forKey: "sessionToken") as! NSDictionary)
                        .value(forKey: "tokenString") as? String
                    UIApplication.setRootView(UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!)
                } else {
                    let alert = UIAlertController(title: "Login error", message: "Try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
