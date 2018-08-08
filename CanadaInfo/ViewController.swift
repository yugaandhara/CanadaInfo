//
//  ViewController.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var infoTableView: UITableView!
    
    let artists = Info.artistsFromBundle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = artists[0].title
        print(artists.count)
        let x = artists[0].title
        print(x)
        let y = artists[0].rows
        infoTableView.rowHeight = UITableViewAutomaticDimension
        infoTableView.estimatedRowHeight = 140
        
        infoTableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//Table View Data Source

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        //print(artists[0].rows.count)
        
        return artists[0].rows.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCellID", for: indexPath) as! InfoTableViewCell
        
        let content = artists[0].rows[indexPath.row]
        cell.discriptionLabel.text? = content.description!
        
        if let myImage = UIImage(named:content.imageHref!) {
        if content.imageHref != nil {
            cell.infoImageView.image = myImage
        }else{
            cell.infoImageView.image = UIImage(named: "Placeholder")
            
//            if article.imageJpgUrl != nil {
//                let artworkUrl = article.imageJpgUrl!
//                let url:URL! = URL(string: artworkUrl)
//                let session = URLSession.shared
//                task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
//                    if let data = try? Data(contentsOf: url){
//                        DispatchQueue.main.async(execute: { () -> Void in
//                            // Before we assign the image, check whether the current cell is visible
//                            if let updateCell = self.tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
//                                let img:UIImage! = UIImage(data: data)
//                                article.image = img
//                                updateCell.infoImageView?.image = img
//                                //self.saveArticles()
//                            }
//                        })
//                    }
//                })
//                task.resume()
//            }
        }
        }
        //cell.nameLabel.text? = content.name
        return cell
    }
    
}

