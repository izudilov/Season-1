//
//  UserViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 01.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class UserViewController: UITableViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.estimatedRowHeight = 63
        tableView.rowHeight = UITableView.automaticDimension
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Users.userData.count
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var sub1 = UIImageView()
            var sub2 = UIImageView()
            var imageFoto = UIImage(named: "")
        
            // Получаем ячейку из пула
            let user = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserViewCell
        
                        
           // Устанавливаем userName and Foto в надпись ячейки
            user.userName.text =  Users.userData[indexPath.row].name
            imageFoto = UIImage(named: Users.userData[indexPath.row].foto)
        
             user.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        
        
        sub1 = UIImageView(frame: CGRect(x: 3, y: 4, width: 60, height: 60))
        sub1.contentMode = .scaleAspectFit
        sub1.image = imageFoto
        
        sub1.layer.cornerRadius = sub1.bounds.height / 2
        sub1.clipsToBounds = true
        
        sub2 = UIImageView(frame: CGRect(x: 3, y: 4, width: 60, height: 60))
        
        sub2.layer.masksToBounds = false
        
        sub2.layer.shadowPath = UIBezierPath(roundedRect: sub2.layer.bounds, cornerRadius: (sub2.bounds.height / 2)).cgPath
        sub2.layer.shadowColor = UIColor.black.cgColor
        sub2.layer.shadowOpacity = 0.8
        sub2.layer.shadowRadius = 3.5
        sub2.layer.shadowOffset = CGSize(width: 3, height: 2)
        
       /* let constraintY = sub1.centerYAnchor.constraint(equalTo: user.userFoto.centerYAnchor)
        let constraintX = sub1.centerXAnchor.constraint(equalTo: user.userFoto.centerXAnchor)
      
        constraintX.isActive = true
        constraintY.isActive = true*/
                
        user.userFoto.addSubview(sub2)
        user.userFoto.addSubview(sub1)
        
        return user
        }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectIndex = self.tableView.indexPathForSelectedRow else {
            return
        }
        if segue.destination is UserCollectionViewController {
            let vc = segue.destination as? UserCollectionViewController
            vc?.image = Users.userData[selectIndex.row].foto
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
