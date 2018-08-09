//
//	CanadaInfo.swift
//
//	Create by mac_admin on 9/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct CanadaInfo{

	var rows : [Row]!
	var title : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		rows = [Row]()
		if let rowsArray = dictionary["rows"] as? [[String:Any]]{
			for dic in rowsArray{
				let value = Row(fromDictionary: dic)
				rows.append(value)
			}
		}
		title = dictionary["title"] as? String
	}

}
