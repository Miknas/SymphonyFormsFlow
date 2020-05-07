//
//  FormsV2ViewModel.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation
import UIKit

class FormsV2ViewModel {
    var items: [FormV2Item] = []
    
    init() {
        items = [
            FormV2Item(t: "First name", v: "", pl: "Enter first name", tc: .red),
            FormV2Item(t: "Last name", v: "", pl: "Enter last name", tc: .red),
            FormV2Item(t: "Email", v: "", pl: "Enter email", tc: .red),
            FormV2Item(t: "Date of birth", v: "", pl: "Select Date", tc: .red),
            FormV2Item(t: "Password", v: "", pl: "Enter password", iss: true, t2: "", v2: "", pl2: "Confirm", iss2: true, tc: .red)
        ]
    }
    
    func sendData() {
        let params = [
            "firstName": items[0].value,
            "lastName": items[1].value,
            "email": items[2].value,
            "dob": items[3].value,
            "password": items[4].value
        ]
    }
}

//class FormV2Item {
//    var title: String = ""
//    var value: String = ""
//    var placeholder: String = ""
//    var themeColor: UIColor = .clear
//    var isSecure: Bool = false
//
//    init(t: String, v: String, pl: String, tc: UIColor, iss: Bool = false){
//        title = t
//        value = v
//        placeholder = pl
//        themeColor = tc
//        isSecure = iss
//    }
//}


class FormV2Item {
    var title: String = ""
    var value: String = ""
    var placeholder: String = ""
    var themeColor: UIColor = .clear
    var isSecure: Bool = false
    
    var title2: String = ""
    var value2: String = ""
    var placeholder2: String = ""
    var isSecure2: Bool = false
    
    init(t: String, v: String, pl: String, tc: UIColor, iss: Bool = false){
        title = t
        value = v
        placeholder = pl
        themeColor = tc
        isSecure = iss
    }
    
    init(t: String, v: String, pl: String, iss: Bool, t2: String, v2: String, pl2: String, iss2: Bool, tc: UIColor){
        title = t
        value = v
        placeholder = pl
        isSecure = iss
        
        title2 = t2
        value2 = v2
        placeholder2 = pl2
        isSecure2 = iss2
        
        themeColor = tc
    }
}
