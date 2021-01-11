//
//  UserVK.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 22.12.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import Foundation

struct UserVK: Decodable {
    var first_name: String
    var last_name: String
    var id: Int
    var photo_100: String
    
    enum CodingKeys: String, CodingKey {
        case first_name
        case last_name
        case id
        case photo_100
      }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.first_name = try container.decode(String.self, forKey: .first_name)
        self.last_name = try container.decode(String.self, forKey: .last_name)
        self.photo_100 = try container.decode(String.self, forKey: .photo_100)
        
    }
}

struct FriendsList: Decodable {
    let items: [UserVK]
    
   enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.items = try container.decode([UserVK].self, forKey: .items)
       
          }
}
    
struct StructAPI: Decodable {
        let response: (FriendsList)
        
        enum CodingKeys: String, CodingKey {
             case response
         }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.response = try container.decode((FriendsList).self, forKey: .response)
           
    }

}

class FriendsVK {
    
    static var friends = [UserVK]()
    
    
    
}
