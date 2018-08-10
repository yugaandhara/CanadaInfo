//
//  InfoTableViewCell.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit

/** This is InfoTableViewCell class
 */
class InfoTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    
    /** Activity Indicator for images
     */
    var showActivity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    /** This method will set data on cell
     */
    func setdataOnCell(_ rowsArray: Row, indexPath: Int) {
        titleLabel.text = rowsArray.title ?? ""
        discriptionLabel.text = rowsArray.descriptionField ?? ""
        infoImageView.image = nil
        showActivity.frame = CGRect(x: infoImageView.frame.size.width/2 - 25, y: infoImageView.frame.size.height/2 - 25, width: 50, height: 50)
        showActivity.startAnimating()
        infoImageView.addSubview(showActivity)
        if let imageUrl = rowsArray.imageHref {
            infoImageView.downloadFrom(link: imageUrl , contentMode: .scaleAspectFit, showActivity: showActivity)
        } else {
            showActivity.stopAnimating()
            infoImageView.image = UIImage(named: "placeHolderImage")
        }
    }
}
