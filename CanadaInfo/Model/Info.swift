//
//  Info.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import UIKit
import Alamofire

struct Info {
    let title: String
    let rows: [Rows]
    
    
    
    static func artistsFromBundle() -> [Info] {
        
        var artists = [Info]()
        guard let url = Bundle.main.url(forResource: "Information", withExtension: "json") else {
            return artists
        }
        do {
                            let data = try Data(contentsOf: url)
                            let jsonValue = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                            print(jsonValue)
                                let title = jsonValue["title"] as? String
                                if let rowsObject = jsonValue["rows"] as? [[String: AnyObject]] {
                                var rows = [Rows]()
                                    var titleForRow = String()
                                    var disc = String()
                                    var image = String()
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
                                     rows.append(Rows(title: titleForRow, description: disc, imageHref: image))
                                }
                                    artists.append(Info(title: title!, rows: rows))
                            }
                        } catch let error as NSError {
                            print(error)
                        }
//        //Alamofire
//        let todoEndpoint: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
//        Alamofire.request(todoEndpoint)
//            .responseJSON { response in
//                guard response.result.error == nil else {
//                    print("error calling GET")
//                    print(response.result.error!)
//                    return
//                }
//
//                guard let json = response.result.value as? [String: Any] else {
//                    print("didn't get Canada Info object as JSON from API")
//                    print("Error: \(response.result.error)")
//                    return
//                }
//
//                guard let todoTitle = json["title"] as? String else {
//                    print("Could not get todo title from JSON")
//                    return
//                }
//                print("The title is: " + todoTitle)
//        }
        
        //let urlString = "http://jsonplaceholder.typicode.com/users/1" // https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json
       // let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
       // URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        //    guard let data = data, error == nil else { return }
//            var error: Error?
//            var string: String? = nil
//            if let aString = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") {
//                string = try? String(contentsOf: aString, encoding: String.Encoding(rawValue: String.Encoding.isoLatin1.rawValue))
//            }
//            var resData: Data? = string?.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
//            guard let canadaInfo = try? JSONDecoder().decode(Info.self, from: data) else {
//                print("Error: Couldn't decode data into Blog")
//                return
//            }
//            print(canadaInfo)
//            artists = canadaInfo
//            print("blog title: \(canadaInfo.title)")
            //print("blog home: \(blog.homepageURL)")
            
//            print("articles:")
//            for article in canadaInfo.articles {
//                print("- \(article.title)")
//            }
            
            
//            do {
//                print(data)
//                let jsonValue = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
//                print(jsonValue)
//                    if let title = jsonValue["title"] as? String,
//                    let rowsObject = jsonValue["rows"] as? [[String: String]] {
//                    var rows = [Rows]()
//                    for rowObject in rowsObject {
//                        if let rowTitle = rowObject["title"],
//                            let discription = rowObject["discription"],
//                            let imageHref = rowObject["imageHref"] {
//                            rows.append(Rows(title: rowTitle, description: discription, imageHref: imageHref))
//                        }
//                    }
//                    artists.append(Info(title: title, rows: rows))
//                }
//            } catch let error as NSError {
//                print(error)
//            }
//        }).resume()
           return artists
    }
  
}

