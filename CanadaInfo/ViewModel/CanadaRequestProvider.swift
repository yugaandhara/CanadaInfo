//
//  CanadaRequestProvider.swift
//  CanadaInfo
//
//  Created by mac_admin on 09/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation

/** Array object for CanadaInfo 
 */
var records = [CanadaInfo]()

/** This is CanadaRequestProvider class
 */
class CanadaRequestProvider: RequestManager {
    /**
     This method will create request.
     
     - parameter sucess: This clouser gets executed when parameter get return sucessfully.
     - parameter failure: This clouser gets executed whrn parameter get return fail.
     */
    func requestToGetCanadaInfo(_ sucess: @escaping (CanadaInfo) -> Void, failure: @ escaping (Error?) -> Void) -> Void {
        let baseURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        if let url = URL(string: baseURL) {
            let urlRequest = URLRequest(url: url)
            makeRequestWithURL(urlRequest, completionHandler: { (json, error) in
                if error != nil {
                    DispatchQueue.main.async(execute: {
                        failure(error)
                    })
                } else {
                    self.parseDataForCanada(json, sucess: { (response: CanadaInfo) -> Void in
                        let infoDict = response
                        DispatchQueue.main.async(execute: {
                            sucess(infoDict)
                        })
                    })
                    { (error: NSError?) -> Void in
                        DispatchQueue.main.async(execute: {
                            failure(error)
                        })
                    }
                }
            })
        }
    }
    
    /**
     This method will convert json into model calss.
     */
    func parseDataForCanada(_ json: [String: Any]?, sucess: (CanadaInfo) -> Void, failure: ((NSError)?) -> Void) -> Void {
        guard let jsonData = json,
            let title = jsonData["title"] as? String,
            let rowsObject = jsonData["rows"] as? [[String: AnyObject]] else {
                let err = NSError(domain: "Data is not available", code: 203, userInfo: nil)
                failure(err)
                return
        }
        var rowsArray = [Row]()
        var titleForRow: String?
        var disc: String?
        var image: String?
        for rowObject in rowsObject {
            if let rowTitle = rowObject["title"] as? String {
                titleForRow = rowTitle
            }
            if let discription = rowObject["description"] as? String {
                disc = discription
            }
            if let imageHref = rowObject["imageHref"] as? String {
                image = imageHref
            }
            if titleForRow != nil || disc != nil || image != nil {
                rowsArray.append(Row(descriptionField: disc, imageHref: image, title: titleForRow))
                titleForRow = nil; disc = nil; image = nil
            }
        }
        let record = CanadaInfo(rows: rowsArray, title: title)
        sucess(record)
    }
}
