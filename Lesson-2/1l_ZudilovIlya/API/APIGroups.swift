//
//  APIGroups.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 20.12.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import Foundation
import Alamofire

class APIGroups {
    
    let baseUrl = "https://api.vk.com/method/"
    let version = "5.126"
    func getData(fields: String?){
        let request = "groups.get"
        guard let user = Session.shared.userID else {return}
        guard let apiKey = Session.shared.acess_token else {return}
        let parameters: Parameters = [
            "user_ids": user,
            "fields": fields as Any,
            "access_token": apiKey,
            "v": version
        ]
        let url = baseUrl+request
        AF.request(url, method: .get, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }
}
