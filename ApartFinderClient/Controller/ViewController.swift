//
//  ViewController.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 06/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let LOG_IN_URL = AppDelegate.DATA_SERVICE_URL + "/main/apartments"
        let parameters = ["tokenstring": AppDelegate.token!]
        print(LOG_IN_URL)
        print(parameters)
        
        AF.request(LOG_IN_URL, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if AppDelegate.token == json["sessionToken"]["tokenString"].string {
                    print("It's okay")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ApartCell") {
            return cell
        }
        return UITableViewCell()
    }
}

