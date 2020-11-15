//
//  UserViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 01.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

private func letter (character: String) -> Character {
    let calendar = character.first
    return calendar!
}

class UserViewController: UITableViewController {

    var sections = [GroupedSection <Character, User>]()
    
    let searchController = UISearchController(searchResultsController: nil)
    private var filteredFriends = [User]()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.estimatedRowHeight = 63
        tableView.rowHeight = UITableView.automaticDimension
        
        self.sections = GroupedSection.group(rows: userData, by: { letter(character: $0.name) })
        self.sections.sort { lhs, rhs in lhs.sectionItem < rhs.sectionItem }
        
        // Setup searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти друзей"
        //tableView.tableHeaderView = searchController.searchBar
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return 1
        }
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredFriends.count
        }
        
        let section = self.sections[section]
        return section.rows.count
    }
    
    override func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int) -> String? {
    
        if isFiltering {
            return "Найденные друзья"
        }

        let section = self.sections[section]
        let date = String(section.sectionItem)
        return date
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var sub1 = UIImageView()
            var sub2 = UIImageView()
            var imageFoto = UIImage(named: "")
        
            // Получаем ячейку из пула
            let user = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserViewCell
        
                        
           // Устанавливаем userName and Foto в надпись ячейки
        
            var friends: User
            
            
    
   /* let constraintY = sub1.centerYAnchor.constraint(equalTo: user.userFoto.centerYAnchor)
    let constraintX = sub1.centerXAnchor.constraint(equalTo: user.userFoto.centerXAnchor)
  
    constraintX.isActive = true
    constraintY.isActive = true*/
            
            sub2 = UIImageView(frame: CGRect(x: 3, y: 4, width: 60, height: 60))

            sub2.layer.masksToBounds = false

            sub2.layer.shadowPath = UIBezierPath(roundedRect: sub2.layer.bounds, cornerRadius: (sub2.bounds.height / 2)).cgPath
            sub2.layer.shadowColor = UIColor.black.cgColor
            sub2.layer.shadowOpacity = 0.8
            sub2.layer.shadowRadius = 3.5
            sub2.layer.shadowOffset = CGSize(width: 3, height: 2)
            
            if user.userFoto.subviews.isEmpty {
            user.userFoto.addSubview(sub2)
            }
        
            if isFiltering {
                friends = filteredFriends[indexPath.row]
                user.userName.text = friends.name
                imageFoto = UIImage(named: friends.foto)
                
            } else {
        
                let section = self.sections[indexPath.section]
                let headline = section.rows[indexPath.row]
                user.userName.text = headline.name
                imageFoto = UIImage(named: headline.foto)
                
            }
       /* user.userName.text = String(Users.users[indexPath.section][indexPath.row].name)
        imageFoto = UIImage(named: Users.users[indexPath.section][indexPath.row].foto)*/
        
            sub1 = UIImageView(frame: CGRect(x: 3, y: 4, width: 60, height: 60))
            sub1.contentMode = .scaleAspectFit
            sub1.image = imageFoto
    
            sub1.layer.cornerRadius = sub1.bounds.height / 2
            sub1.clipsToBounds = true

            
        
            user.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

 
            user.userFoto.addSubview(sub1)
            
            return user
        }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectIndex = self.tableView.indexPathForSelectedRow else {
            return
        }
        if segue.destination is UserCollectionViewController {
           
            
            let vc = segue.destination as? UserCollectionViewController

            if isFiltering {
                let headline = filteredFriends[selectIndex.row]
                vc?.image = headline.foto

            } else {
                let section = self.sections[selectIndex.section]
                let headline = section.rows[selectIndex.row]
                vc?.image = headline.foto
            }
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

extension UserViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText (_ searchText: String) {
        
        filteredFriends = userData.filter({ (friends: User) -> Bool in
            return friends.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}
