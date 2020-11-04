//
//  User.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 01.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class Users {
    
    var name: String
    var foto: String

 
    init(name: String, foto: String) {

        self.name = name
        self.foto = foto
        
    }

    static var userData: [Users] = [
        Users(name: "Спанч Боб", foto: "Spanch Bob.jpg"),
        Users(name: "Патрик", foto: "Patrick.jpg"),
        Users(name: "Мистер Крабс", foto: "Mister Krabs.jpg")
    ]

    
}
