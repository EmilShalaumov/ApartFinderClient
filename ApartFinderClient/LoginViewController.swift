//
//  LoginViewController.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 07/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInBtnPressed(_ sender: UIButton) {
        print(DataService.logIn(username: usernameTextField.text!, password: passwordTextField.text!))
    }
}
