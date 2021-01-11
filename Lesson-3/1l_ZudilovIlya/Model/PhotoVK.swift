//
//  PhotoVK.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 27.12.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import Foundation

struct PhotoVK: Decodable {
    
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case url
      }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.url = try container.decode(String.self, forKey: .url)
       
        
    }
}

struct PhotoSize: Decodable {
    let sizes: [PhotoVK]
    
   enum CodingKeys: String, CodingKey {
        case sizes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.sizes = try container.decode([PhotoVK].self, forKey: .sizes)
       
          }
}
    
struct PhotoList: Decodable {
    let items: [PhotoSize]
    
   enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.items = try container.decode([PhotoSize].self, forKey: .items)
       
          }
}
    
struct StructAPIPhoto: Decodable {
        let response: (PhotoList)
        
        enum CodingKeys: String, CodingKey {
             case response
         }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.response = try container.decode((PhotoList).self, forKey: .response)
           
    }

}

class AllPhotosVK {
    
    static var photosFromVK = [PhotoSize]()
    
    
    
}
