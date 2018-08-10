//
//  ViewController.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit

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
    
    /** UIRefreshControl object
     */
    var refreshControl = UIRefreshControl()
    
    //MARK: - View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webServiceCall()
        infoTableView.isHidden = true
        infoTableView.rowHeight = UITableViewAutomaticDimension
        infoTableView.estimatedRowHeight = 144
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Canada Info ...")
        refreshControl.addTarget(self, action: #selector(ViewController.refreshCanadaInfoData(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            infoTableView.refreshControl = refreshControl
        } else {
            infoTableView.addSubview(refreshControl)
        }
    }
    
    @objc private func refreshCanadaInfoData(_ sender: Any) {
        webServiceCall()
    }
    
    /** This method will send request and get back with response from server
     */
    func webServiceCall() {
        let canadaRequestProvider = CanadaRequestProvider()
        canadaRequestProvider.requestToGetCanadaInfo({ [weak self] (response: CanadaInfo) -> Void in
            self?.infoTableView.isHidden = false
            let title = response.title
            self?.navigationItem.title = title
            self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 22)!]
            self?.rowArray = response.rows
            self?.infoTableView.reloadData()
            self?.refreshControl.endRefreshing()
        }) { (error: Error?) -> Void in
            print(error as Any)
        }
    }
}



