//
//  Handler.swift
//  CanadaInfo
//
//  Created by mac_admin on 08/08/18.
//  Copyright © 2018 Yugandhara. All rights reserved.
//

import Foundation

//class a {
// func artistsFromBundle() -> [Info] {
//
//    var artist = [Info]()
//
//    let urlString = "http://jsonplaceholder.typicode.com/users/1" // https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json
//    let url = URL(string: "http://domain.com/file.php")
//    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
//        guard let data = data, error == nil else { return }
//
//        do {
//            let jsonValue = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
//            //                parseJson(json: json, completion: { (Success) in
//            //                    return artists
//            //                })
//            //let posts = json["posts"] as? [[String: Any]] ?? []
//            print(jsonValue)
//            return parseJsonValue(json: jsonValue)
//
//        } catch let error as NSError {
//            print(error)
//        }
//    }).resume()
//}
//
//func parseJsonValue(json: [String:Any]) -> [Info] {
//    //func parseJson(json: [String:Any], completion: ([Info])) {
//    var artists = [Info]()
//    if let title = json["title"] as? String,
//        let rowsObject = json["rows"] as? [[String: String]] {
//        var rows = [Rows]()
//        for rowObject in rowsObject {
//            if let rowTitle = rowObject["title"],
//                let discription = rowObject["discription"],
//                let imageHref = rowObject["imageHref"] {
//                rows.append(Rows(title: rowTitle, description: discription, imageHref: imageHref))
//            }
//        }
//        artists.append(Info(title: title, rows: rows))
//    }
//    return artists
//}
//}

