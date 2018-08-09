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
    
    var rowArray = [Row]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webServiceCall()
        infoTableView.rowHeight = UITableViewAutomaticDimension
        infoTableView.estimatedRowHeight = 144
        infoTableView.reloadData()
        
    }
    
    func webServiceCall() {
        let canadaRequestProvider = CanadaRequestProvider()
        canadaRequestProvider.requestToGetCanadaInfo({ [weak self] (response: CanadaInfo) -> Void in
            let title = response.title
            self?.navigationItem.title = title
            self?.rowArray = response.rows
            
            
//            let title = response?["title"] as? String
//            self?.navigationItem.title = title
//           
//            if let rowsObject = response?["rows"] as? [[String: AnyObject]] {
//                //var rows = [Rows]()
//                var titleForRow = String()
//                var disc = String()
//                var image = String()
//                for rowObject in rowsObject {
//                    if let rowTitle = rowObject["title"] as? String {
//                        titleForRow = rowTitle
//                    }
//                    if let discription = rowObject["description"] as? String {
//                        disc = discription
//                    }
//                    if let imageHref = rowObject["imageHref"] as? String {
//                        image = imageHref
//                    }
//                    self?.rows.append(Rows(title: titleForRow, description: disc, imageHref: image))
//                }
//                
//            }
          
            
            
            
            self?.infoTableView.reloadData()
        }) { (error: Error?) -> Void in
            print(error as Any)
        }
    }


}
//Table View Data Source

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCellID", for: indexPath) as! InfoTableViewCell
        //let content = artists[0].rows[indexPath.row]
        let content = rowArray[indexPath.row]
        cell.setdataOnCell(content, indexPath: indexPath.row)
        return cell
    }
}


extension UIImageView {
    func downloadFrom(link: String, contentMode mode: UIViewContentMode, showActivity: UIActivityIndicatorView? = nil) {
        guard let url = URL(string: link) else {
            return
        }
        contentMode = mode
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let mineType = response?.mimeType, mineType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) else {
                    print("Errorrrr")
                      DispatchQueue.main.async { () -> Void in
                    let tempImage = UIImage(named: "placeHolderImage")
                    self.image = tempImage
                    if let showActivityIndicator = showActivity {
                        showActivityIndicator.stopAnimating()
                    }
                    }
                    return
            }
            DispatchQueue.main.async { () -> Void in
                self.image = image
                if let showActivityIndicator = showActivity {
                    showActivityIndicator.stopAnimating()
                }
            }
        }).resume()
       
    }
    
//    func setImage(image: UIImage) {
//        DispatchQueue.main.async { () -> Void in
//            self.image = image
//            if let showActivityIndicator = showActivity {
//                showActivityIndicator.stopAnimating()
//            }
//        }
//
//    }
}

