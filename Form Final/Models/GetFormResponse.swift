//
//  GetFormResponse.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation
import ObjectMapper

class GetFormResponse: NSObject, Mappable {
    var items : [GetFormResponseItem] = [GetFormResponseItem]()
    var skipElements: [String] = []
    var themeColor: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        skipElements <- map["skipElements"]
        themeColor <- map["themeColor"]
    }
}

class GetFormResponseItem: NSObject, Mappable {
    var placeholder : String = ""
    var jsonKey : String = ""
    var title : String = ""
    var placeholder2 : String = ""
    var jsonKey2 : String = ""
    var title2 : String = ""
    var formType : String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        placeholder <- map["placeholder"]
        jsonKey <- map["jsonKey"]
        title <- map["title"]
        placeholder2 <- map["placeholder2"]
        jsonKey2 <- map["jsonKey2"]
        title2 <- map["title2"]
        formType <- map["formType"]
    }
}
