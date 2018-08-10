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

/** This is ViewController class
 */
class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var infoTableView: UITableView!
    
    //MARK: - Cell ID
    let infoTableViewCellID = "InfoTableViewCellID"
    
    /** Array object for Canada Info row
     */
    var rowArray = [Row]()
    
    //MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webServiceCall()
        infoTableView.isHidden = true
        infoTableView.rowHeight = UITableViewAutomaticDimension
        infoTableView.estimatedRowHeight = 144
        //infoTableView.reloadData()
    }
    
    /** This method will send request and get back with response from server
     */
    func webServiceCall() {
        let canadaRequestProvider = CanadaRequestProvider()
        canadaRequestProvider.requestToGetCanadaInfo({ [weak self] (response: CanadaInfo) -> Void in
            self?.infoTableView.isHidden = false
            let title = response.title
            self?.navigationItem.title = title
            self?.rowArray = response.rows
            self?.infoTableView.reloadData()
        }) { (error: Error?) -> Void in
            print(error as Any)
        }
    }
}


//MARK: - Extention of ViewController for UITableViewDataSource methods
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoTableViewCellID, for: indexPath) as! InfoTableViewCell
        let content = rowArray[indexPath.row]
        cell.setdataOnCell(content, indexPath: indexPath.row)
        return cell
    }
}
