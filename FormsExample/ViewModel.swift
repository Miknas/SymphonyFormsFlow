//
//  ViewModel.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation

class ViewModel {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    
    func sendData(firstName: String, lastName: String, email: String, password: String){
        let params = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
        ]
    }
    
    func sendData() {
        let params = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
        ]
    }
}
