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
    
    /*let baseUrl = "https://api.vk.com/method/"
    let version = "5.126"
    func getData(){
        let request = "groups.get"
        guard let user = Session.shared.userID else {return}
        guard let apiKey = Session.shared.acess_token else {return}
        let parameters: Parameters = [
            "user_ids": user,
            "fields": "name,photo_100",
            "access_token": apiKey,
            "v": version,
            "extended": "1"
        ]
        let url = baseUrl+request
        AF.request(url, method: .get, parameters:
                    parameters).responseJSON { repsonse in
                        print(repsonse.value!)
                    }
    }*/
    
    
    let baseUrl = "https://api.vk.com/method/"
    let version = "5.126"

    
    func loadVKGroups(completion: @escaping ([GroupVK]) -> Void ){
        
        let request = "groups.get"
        
        guard let user = Session.shared.userID else {return}
        guard let apiKey = Session.shared.acess_token else {return}
        
        let parameters: Parameters = [
            "user_ids": user,
            "fields": "name,photo_100",
            "access_token": apiKey,
            "v": version,
            "extended": "1"
        ]
        
        let url = baseUrl+request
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
                       
            guard let data = response.data else { return }
            
            do {
                let parsedResult: StructAPIGruop = try JSONDecoder().decode(StructAPIGruop.self, from: data)
                let array = parsedResult.response.items
                MyGroupVK.groupsFromVK = array
                print(array[0].name)
                completion (array)
                
            }
            catch {
                print(error)
            }
           
            
           /* switch response.result {
               
                        case .success:
                                    do {
                                        let parsedResult: StructAPI = try JSONDecoder().decode(StructAPI.self, from: response.data!)
                                        let array = parsedResult.response.items
                                        FriendsVK.friends = array
                                        
                                        return
                                        }
                                    catch {
                                        print(error)
                                    }
                            
                        case .failure(let error):
                                print(error)
            
           
                    }*/
        
        }
        
    }
}
