//
//  APINews.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 06.02.2021.
//  Copyright © 2021 izudilov. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class APINews {
    
    let baseUrl = "https://api.vk.com/method/"
    let version = "5.126"

    
    func loadVKNews (completion: @escaping (Response) -> Void ){
        
        print("Hi")
        let request = "newsfeed.get"
        
        guard let user = Session.shared.userID else {return}
        guard let apiKey = Session.shared.acess_token else {return}
        
        let parameters: Parameters = [
            "filters": "post",
            "access_token": apiKey,
            "v": version
        ]
        
        let url = baseUrl+request
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            print(response.request)
          
            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                //dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM в HH:mm")
                decoder.dateDecodingStrategy = .millisecondsSince1970
                let parsedResult: Welcome = try JSONDecoder().decode(Welcome.self, from: data)
                let array = parsedResult.response
                //print(array[0].text)
                NewsTableViewController.newsVK = array
                completion (array)
                
            }
            catch {
                print(error)
            }
           
            /*let parsing = DispatchQueue.global(qos: .userInteractive)
            
            parsing.async {
                AF.request(url, method: .get, parameters: parameters).responseJSON { response in
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let dateFormatter = DateFormatter()
                        decoder.dateDecodingStrategy = .millisecondsSince1970
                        let parsedResult: [Item] = try JSONDecoder().decode([Item].self, from: data)
                        let array = parsedResult
                }
                catch {
                    print(error)
                    }
                }
            }
                
            parsing.async {
                AF.request(url, method: .get, parameters: parameters).responseJSON { response in
                    guard let data = response.data else { return }
                    do {
                        let parsedResult: Group = try JSONDecoder().decode(Group.self, from: data)
                        let array = parsedResult
                }
                catch {
                    print(error)
                    }
                }
            }
            
            parsing.async {
                AF.request(url, method: .get, parameters: parameters).responseJSON { response in
                    guard let data = response.data else { return }
                    do {
                        let parsedResult: Profile = try JSONDecoder().decode(Profile.self, from: data)
                        let array = parsedResult
                }
                catch {
                    print(error)
                    }
                }
            }*/
           
        
        }
        
    }
}

