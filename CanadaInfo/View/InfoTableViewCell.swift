//
//  InfoTableViewCell.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var discriptionLabel: UILabel!
    
    @IBOutlet weak var infoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
