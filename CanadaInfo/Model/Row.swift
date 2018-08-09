//
//	Row.swift
//
//	Create by mac_admin on 9/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Row{

	var descriptionField : String!
	var imageHref : String!
	var title : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
        descriptionField = dictionary["description"] as? String
        imageHref = dictionary["imageHref"] as? String
        title = dictionary["title"] as? String
	}

}
