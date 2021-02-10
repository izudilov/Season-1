//
//  NewsTableViewController.swift
//  1l_ZudilovIlya
//
//  Created by user179996 on 15.11.2020.
//  Copyright © 2020 izudilov. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    static var newsVK: Response?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NewsTableViewController.newsVK?.items[0].text)
        
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCellxib")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (NewsTableViewController.newsVK?.items.count)!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (NewsTableViewController.newsVK?.items.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellxib", for: indexPath) as! NewsCell
               
        
            cell.userFoto.image = try? UIImage(data: Data(contentsOf: ((URL(string: NewsTableViewController.newsVK?.groups[indexPath.row].photo_50 ?? "https://vk.com/images/camera_50.png")) ?? URL(string: "https://vk.com/images/camera_50.png"))!))
            
            cell.userName.text = NewsTableViewController.newsVK?.groups[indexPath.row].name
        
        
       
        
            if let timeResult = (NewsTableViewController.newsVK?.items[indexPath.row].date as? Double) {
                let date = Date(timeIntervalSince1970: timeResult)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMM в HH:mm"
                dateFormatter.timeZone = .current
                cell.newsData.text = dateFormatter.string(from: date)
            
             
        
            cell.newsText.text = NewsTableViewController.newsVK?.items[indexPath.row].text
            cell.views.text = NewsTableViewController.newsVK?.items[indexPath.row].views.count.description ?? "0"
            cell.newsFoto.image = try? UIImage(data: Data(contentsOf: (URL(string: (NewsTableViewController.newsVK?.items[indexPath.row].attachments?[0].photo?.sizes?.last?.url) ?? "https://vk.com/images/camera_200.png"))!))
            cell.comments.text = NewsTableViewController.newsVK?.items[indexPath.row].comments.count.description
        
            if cell.like.tag == 0 {
                cell.like.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                cell.like.tintColor = .red
                cell.countNumber = (NewsTableViewController.newsVK?.items[indexPath.row].likes.count ?? 0) + 1
                cell.likeNumbers.text = "\(cell.countNumber)"
                cell.like.tag = 1
            
            } else if cell.like.tag == 1 {
                cell.like.setImage(UIImage(systemName: "heart"), for: .normal)
                cell.like.tintColor = .systemBlue
                cell.countNumber = (NewsTableViewController.newsVK?.items[indexPath.row].likes.count ?? 0) - 1
                cell.likeNumbers.text = "\(cell.countNumber)"
                cell.like.tag = 0
                
            } else if cell.like.tag > 1  {
                cell.like.tag = 1
            }
        }
        
        return cell
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
