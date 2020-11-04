//
//  GroupViewCell.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 02.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class GroupViewCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupLogo: UIImageView!

    
    override func layoutSubviews() {
    groupLogo.layer.cornerRadius = groupLogo.bounds.height / 2
    groupLogo.clipsToBounds = true
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
