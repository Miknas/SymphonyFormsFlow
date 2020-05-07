//
//  RegistrationFormItem.swift
//  FormsExample
//
//  Created by Namik Catibusic on 06/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation

enum RegistrationItemType {
    case text
    case secure
    case numbers
    case comboBox
    case privacyBox
    case button
    case buttonPretrazi
    case buttonCancel
    case twoTextfields
    case twoDates
    case slider
    case detailText
    case htmlEditor
    case explanation
    case checkboxes
    case title
    case noDataCell
    case selectedCategories
    case unknown
}

class RegistrationFormSection {
    var index: Int = -1
    var title: String = ""
    var items: [RegistrationFormItem] = []
    
    init(title: String, items: [RegistrationFormItem]){
        self.title = title
        self.items = items
    }
    
}

class RegistrationFormItem: NSObject {
    var isRequired: Bool = false
    var value: String = ""
    var jsonKey: String = ""
    var placeHolder: String = ""
    var options: [String] = []
    var isExpanded: Bool = false
    var isSelected: Bool = false
    var type: RegistrationItemType = .unknown
    var value2: String = ""
    var placeholder2: String = ""
    var jsonKey2: String = ""
    var info: String = ""
    var info2: String = ""
    var isAutocomplete: Bool = false
    var selectedOnes: [Bool] = []
    
    init(isReq: Bool, val: String, jsonKey: String, placeholder: String, options: [String], type: RegistrationItemType, value2: String = "", placeholder2: String = "", jsonKey2:String = "", info: String = "", autoComplete: Bool = false, selectedOnes: [Bool] = []){
        self.isRequired = isReq
        self.value = val
        self.jsonKey = jsonKey
        self.placeHolder = placeholder
        self.options = options
        
        self.value2 = value2
        self.placeholder2 = placeholder2
        self.jsonKey2 = jsonKey2
        
        self.info = info
        self.isAutocomplete = autoComplete
        self.selectedOnes = selectedOnes
        self.type = type
    }
}
