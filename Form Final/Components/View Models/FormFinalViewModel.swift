//
//  FormFinalViewModel.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

enum CellType: String {
    case text = "text"
    case secure = "secure"
    case twoTextField = "twoFields"
    case date = "date"
    case button = "button"
    case unknown
}

import Foundation
import UIKit

protocol FormFinalViewModelOutput: class {
    func refreshUI()
}

class FormFinalViewModel {
    var items: [FormFinalItem] = [FormFinalItem]()
    var skipJsons : [String] = ["send", "clear"]
    var themeColor: UIColor = .clear
    
    weak var output: FormFinalViewModelOutput?
    
    init () {
        themeColor = .red
        items = [
            FormFinalItem(cellType: .text, title: "First name", value: "", placeholder: "Enter first name", jsonKey: "firstName"),
            FormFinalItem(cellType: .text, title: "Last name", value: "", placeholder: "Enter last name", jsonKey: "lastName"),
            FormFinalItem(cellType: .text, title: "Email", value: "", placeholder: "Enter email", jsonKey: "email"),
            FormFinalItem(cellType: .date, title: "Date of birth", value: "", placeholder: "Select Date", jsonKey: "dob"),
            FormFinalItem(cellType: .twoTextField, title: "Password", value: "", placeholder: "Enter password", jsonKey: "password", title2: "", value2: "", placeholder2: "Confirm", jsonKey2: "confirmPassword", isSecure: true, isSecure2: true),
            FormFinalItem(cellType: .button, title: "Send now", value: "", placeholder: "",  jsonKey: "send"),
            FormFinalItem(cellType: .button, title: "Clear data", value: "", placeholder: "",  jsonKey: "clear")
        ]
    }
    
    func sendData() {
        var params: [String: String] = [:]
        let filteredItems = items.filter({!skipJsons.contains($0.jsonKey)})
        _ = filteredItems.map({params[$0.jsonKey] = $0.value})
        //send data
        print(params)
    }
    
    func clearData() {
        _ = items.map({$0.value = ""})
    }
}


class FormFinalItem: NSObject {
    var cellType : CellType = .unknown
    
    var title: String = ""
    var value: String = ""
    var placeholder: String = ""
    var isSecure: Bool = false
    var jsonKey: String = ""
    
    var title2: String = ""
    var value2: String = ""
    var placeholder2: String = ""
    var isSecure2: Bool = false
    var jsonKey2: String = ""
    
    init(cellType: CellType, title: String, value: String, placeholder: String, jsonKey: String,  title2: String = "", value2: String = "", placeholder2: String = "", jsonKey2: String = "", isSecure: Bool = false, isSecure2: Bool = false){
        self.cellType = cellType
        
        self.title = title
        self.value = value
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.jsonKey = jsonKey
        
        self.title2 = title2
        self.value2 = value2
        self.placeholder2 = placeholder2
        self.isSecure2 = isSecure2
        self.jsonKey2 = jsonKey2
        
    }
}



extension FormFinalViewModel {
    func getData() {
        let interactor = GetFormInteractor()
        interactor.output = self
        interactor.getForm()
    }
}

extension FormFinalViewModel: GetFormInteractorOutput {
    func getForm(model: GetFormResponse?, error: Error?) {
        if let err = error {
            
        }
        else {
            items = []
            self.skipJsons = model!.skipElements
            if let color = UIColor(hex: model!.themeColor) {
                self.themeColor = color
            }
            for itm in model!.items {
                let item = FormFinalItem(cellType: CellType(rawValue: itm.formType) ?? .unknown, title: itm.title, value: "", placeholder: itm.placeholder, jsonKey: itm.jsonKey)
                self.items.append(item)
            }
            items.append(FormFinalItem(cellType: .button, title: "Send now", value: "", placeholder: "",  jsonKey: "send"))
            items.append(FormFinalItem(cellType: .button, title: "Clear data", value: "", placeholder: "",  jsonKey: "clear"))
            output?.refreshUI()
        }
    }
}
