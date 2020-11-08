//
//  UserCollectionViewCell.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 01.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    var countNumber = 0
    
    @IBOutlet weak var userFotoCollection: UIImageView!
    
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var buttonLike: UIButton!
    
    @IBAction func clikLike(_ sender: UIButton) {
        
        if buttonLike.tag == 0 {
            buttonLike.setImage(UIImage(named: "heart"), for: .normal)
            countNumber += 1
            count.text = "\(countNumber)"
            buttonLike.tag = 1
        } else   {
            buttonLike.setImage(UIImage(named: "addlike"), for: .normal)
            countNumber -= 1
            count.text = "\(countNumber)"
            buttonLike.tag = 0
            
        }
    
    }
}
