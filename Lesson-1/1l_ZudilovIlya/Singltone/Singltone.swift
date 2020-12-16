//
//  Singltone.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 16.12.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class Singltone: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDataInfo = UserData.shared
        label.text = """
        \(userDataInfo.userName ?? "nill")
        \(userDataInfo.userId ?? 00112)
        \(userDataInfo.token ?? "nill")
        """

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
