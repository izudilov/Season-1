//
//  GroupVK.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 23.12.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import Foundation

struct GroupVK: Decodable {
    
    var id: Int
    var name: String
    var photo_100: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo_100
      }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.photo_100 = try container.decode(String.self, forKey: .photo_100)
        
    }
}

struct GroupsList: Decodable {
    let items: [GroupVK]
    
   enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.items = try container.decode([GroupVK].self, forKey: .items)
       
          }
}
    
struct StructAPIGruop: Decodable {
        let response: (GroupsList)
        
        enum CodingKeys: String, CodingKey {
             case response
         }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.response = try container.decode((GroupsList).self, forKey: .response)
           
    }

}

class MyGroupVK {
    
    static var groupsFromVK = [GroupVK]()
    
    
    
}
