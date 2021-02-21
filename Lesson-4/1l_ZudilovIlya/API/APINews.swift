//
//  APINews.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 06.02.2021.
//  Copyright © 2021 izudilov. All rights reserved.
//

import Foundation
import Alamofire

class APINews: Operation {
    
    var outputData: Response?
    
    override func main() {
    
        guard let getDataOperation = dependencies.first as? GetData,
        let data = getDataOperation.data else { return }

        do {
            let decoder = JSONDecoder()
            //let dateFormatter = DateFormatter()
            //dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM в HH:mm")
            decoder.dateDecodingStrategy = .millisecondsSince1970            
            let parsedResult: Welcome = try JSONDecoder().decode(Welcome.self, from: data)
            let array = parsedResult.response
            self.outputData = array
            //print(array[0].text)
            //NewsTableViewController.newsVK = array
        }
        catch {
            print(error)
        }
        
    }
}



