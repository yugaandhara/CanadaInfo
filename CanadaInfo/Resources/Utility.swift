//
//  Utility.swift
//  CanadaInfo
//
//  Created by mac_admin on 10/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation
import UIKit

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

