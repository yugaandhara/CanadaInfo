//
//  RequestManager.swift
//  CanadaInfo
//
//  Created by mac_admin on 09/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation

//MARK: - typealise
typealias ServiceResponse = ([String: AnyObject]?, Error?) -> Void

/** This is RequestManager class
 */
class RequestManager: NSObject {
    /**
     This method will send request on Server.
     */
    func makeRequestWithURL(_ request: URLRequest, completionHandler: @escaping (ServiceResponse)) {
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                let json = self?.parseData(data: data!)
                completionHandler(json, error)
            }
        })
        task.resume()
    }
    
    /**
     This method will parse json data.
     */
    func parseData(data: Data) -> [String: AnyObject]? {
        print(data)
        let dataString = NSString(data: data, encoding: String.Encoding.isoLatin1.rawValue)
        if let jsonData = dataString?.data(using: String.Encoding.utf8.rawValue) {
            do {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: AnyObject] {
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
