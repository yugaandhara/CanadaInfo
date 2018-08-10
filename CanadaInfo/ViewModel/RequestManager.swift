//
//  RequestManager.swift
//  CanadaInfo
//
//  Created by mac_admin on 09/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation
import Alamofire

//MARK: - typealise
typealias ServiceResponse = ([String: Any]?, Error?) -> Void

/** This is RequestManager class
 */
class RequestManager: NSObject {
    /**
     This method will send request on Server.
     */
    func makeRequestWithURL(_ request: URLRequest, completionHandler: @escaping (ServiceResponse)) {
        Alamofire.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                // JSON contains "É" in third last object. Used JSONSerialization.
                if let data = response.data {
                    let json = self.parseData(data: data)
                    completionHandler(json, nil)
                }
        }
    }
    
    /**
     This method will parse json data.
     */
    func parseData(data: Data) -> [String: AnyObject]? {
        let dataString = NSString(data: data, encoding: String.Encoding.isoLatin1.rawValue)
        if let jsonData = dataString?.data(using: String.Encoding.utf8.rawValue) {
            do {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: AnyObject] {
                    print("JSON: ", json)
                    return json
                } else {
                    let jsonErrorString = String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                    print("Error could not parse Json: \(String(describing: jsonErrorString))")
                }
            } catch let parseError {
                print(parseError)
                let jsonErrorString = String(data: jsonData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                print("Error could not parse Json: \(String(describing: jsonErrorString))")
            }
        }
        return nil
    }
}
