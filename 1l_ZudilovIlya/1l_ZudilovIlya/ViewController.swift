//
//  ViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 22.10.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapToNextView(_ sender: Any) {
        let storyBord: UIStoryboard = UIStoryboard  (name: "Main", bundle: nil)
        let newViewControler = storyBord.instantiateViewController(withIdentifier: "404") as! NewViewController
        self.present(newViewControler, animated: true, completion: nil)
    }
    @IBAction func go404(_ sender: Any) {
        performSegue(withIdentifier: "go404", sender: nil)
    }
}

