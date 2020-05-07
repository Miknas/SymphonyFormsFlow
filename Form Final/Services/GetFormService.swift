//
//  GetForm.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation
import Alamofire

protocol GetFormServiceOutput {
    func getForm(object : [String: AnyObject]?, error: Error?)
}

class GetFormService {
    var output: GetFormServiceOutput?
    func getForm() {
        AF.request("http://localhost:3000/" + "forms" , method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if let err = response.error {
                self.output?.getForm(object: nil, error: err.underlyingError)
            }
            else {
                self.output?.getForm(object: response.value as? [String: AnyObject], error: nil)
            }
        }
    }
}
