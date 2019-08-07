//
//  DataService.swift
//  ApartFinderClient
//
//  Created by Эмиль Шалаумов on 07/08/2019.
//  Copyright © 2019 Emil Shalaumov. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    static let DATA_SERVICE_URL = "http://localhost:8080"
    
    static func logIn(username: String, password: String) -> String {
        let LOG_IN_URL = DATA_SERVICE_URL + "/auth/login"
        
        let parameters = ["username": username,
                          "password": password]
        
        /*Alamofire.Request(LOG_IN_URL, method: .get, parameters: parameters).responseJSON { response in
            print(response)
        }*/
        
        var s: String = "k"
        AF.request(LOG_IN_URL, method: .get, parameters: parameters).responseJSON { response in
            print(response)
            
            if let result = response.value {
                let jsonData = result as! NSDictionary
                s = jsonData.value(forKey: "user") as! String
            }
        }
        
        
        
        
        
        return s
    }
    
}


