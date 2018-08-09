//
//  InfoTableViewCell.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    
    @IBOutlet weak var infoImageView: UIImageView!
    
    var showActivity = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setdataOnCell(_ rowsArray: Row, indexPath: Int) {
        print(rowsArray.title)
        print(rowsArray.descriptionField)
        print(rowsArray.imageHref)
        titleLabel.text = rowsArray.title ?? ""
        discriptionLabel.text = rowsArray.descriptionField ?? ""
        infoImageView.image = nil
        showActivity.frame = CGRect(x: infoImageView.frame.size.width/2 - 25, y: infoImageView.frame.size.height/2 - 25, width: 50, height: 50)
        showActivity.startAnimating()
        infoImageView.addSubview(showActivity)
        if let imageUrl = rowsArray.imageHref {
            infoImageView.downloadFrom(link: imageUrl , contentMode: .scaleAspectFit, showActivity: showActivity)
        }
    }

}
