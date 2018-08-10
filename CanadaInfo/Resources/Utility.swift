//
//  Utility.swift
//  CanadaInfo
//
//  Created by mac_admin on 10/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Extention of UIImageView for download images
extension UIImageView {
    func downloadFrom(link: String, contentMode mode: UIViewContentMode, showActivity: UIActivityIndicatorView? = nil) {
        guard let url = URL(string: link) else { return }
        contentMode = mode
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard let mineType = response?.mimeType, mineType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) else {
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
}
