//
//  CanadaRequestProvider.swift
//  CanadaInfo
//
//  Created by mac_admin on 09/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation

var records = [CanadaInfo]()

class CanadaRequestProvider: RequestManager {
    
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
    
    func parseDataForCanada(_ json: [String: AnyObject]?, sucess: (CanadaInfo) -> Void, failure: ((NSError)?) -> Void) -> Void {
        guard let jsonData = json,
            let title = jsonData["title"] as? String,
            let rowsObject = jsonData["rows"] as? [[String: AnyObject]] else {
                let err = NSError(domain: "Data is not available", code: 203, userInfo: nil)
                failure(err)
                return
        }
        print(title)
        print(rowsObject)
        let records = CanadaInfo.init(fromDictionary: jsonData)
        print(records.title)
        sucess(records)
    }
}
