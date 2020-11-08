//
//  GroupViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 02.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class GroupViewController: UITableViewController {

    var addGroup = MyGroups(name: "", logo: "")
    
        @IBAction func addGroup(segue: UIStoryboardSegue) {
         
        // Проверяем идентификатор, чтобы убедиться, что это нужный переход
        if segue.identifier == "addGroup" {
           
            if !MyGroups.myGroupData.contains(where: { (MyGroups) -> Bool in
                if MyGroups.name == addGroup.name {
                    return true
                } else {
                    return false
                }
            })
            
                {
                    MyGroups.myGroupData.append(addGroup)
                    // Обновляем таблицу
                    tableView.reloadData()
                
            } else {
               showLoginError()
            }
           
        }
           
    }
                
    
        

        override func viewDidLoad() {
        super.viewDidLoad()
            
            let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButton))
            self.navigationItem.rightBarButtonItem = button

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //   self.navigationItem.rightBarButtonItem = UIBarButtonItem()
        
        tableView.estimatedRowHeight = 63
        tableView.rowHeight = UITableView.automaticDimension
        
    }

    // MARK: - Table view data source
 /*   func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "nextVC" {
                let a = segue.destination as! NoMyGroupViewController
                
            }*/
    @objc func barButton() {
        print("Button Tapped")
        performSegue(withIdentifier: "nextVC", sender: self)
           //If you want pass data while segue you can use prepare segue method
    
    }

    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ой", message: "Ты уже состоишь в указанной группе", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyGroups.myGroupData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupViewCell

        cell.groupName.text =  MyGroups.myGroupData[indexPath.row].name
        cell.groupLogo.image = UIImage(named: MyGroups.myGroupData[indexPath.row].logo)

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем город из массива
                MyGroups.myGroupData.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

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
