//
//  CustomeImageView.swift
//  CanadaInfo
//
//  Created by mac_admin on 10/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit

/** This is CustomeImageView class
 */
class CustomeImageView: UIImageView {
    
    let imageCache = NSCache<NSString, AnyObject>()
    
    func downloadFrom(link: String, contentMode mode: UIViewContentMode, showActivity: UIActivityIndicatorView? = nil) {
        guard let url = URL(string: link) else { return }
        contentMode = mode
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                guard let mineType = response?.mimeType, mineType.hasPrefix("image"),
                    let data = data, error == nil,
                    let cacheimage = UIImage(data: data) else {
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
                    self.imageCache.setObject(cacheimage, forKey: url.absoluteString as NSString)
                    self.image = cacheimage
                    if let showActivityIndicator = showActivity {
                        showActivityIndicator.stopAnimating()
                    }
                }
            }).resume()
        }
    }
}
